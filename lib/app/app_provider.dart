import 'dart:async';

import 'package:fitnessx/navigation/routes.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  bool notificationEnabled = false ;

  void toggleNotification(){
    notificationEnabled = !notificationEnabled;
    notifyListeners();
  }

  void checkLoggedIn(BuildContext context){
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
      
    });
  }

}