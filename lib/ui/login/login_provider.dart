import 'package:fitnessx/main.dart';
import 'package:fitnessx/navigation/routes.dart';
import 'package:fitnessx/utils/validations.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  final emailController  = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = false;


  void togglePasseord() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void validate(){
    // final context = navigatorKey.currentContext;
    String? snackBarMessage;
    if(emailController.text.isEmpty){
      snackBarMessage = "Please Enter Email address";
    }else if(!emailController.text.isValid()){
      snackBarMessage = "Please Enter Valid Email address";
    }else if(passwordController.text.isEmpty){
      snackBarMessage = "Please Enter Password";
    }
    if(snackBarMessage != null){
      scafoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(snackBarMessage))
        );
        debugPrint("snackbar");
        return;
    }
    navigatorKey.currentState?.pushReplacementNamed(Routes.home);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}