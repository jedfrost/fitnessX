import 'package:fitnessx/app/app_colors.dart';
import 'package:fitnessx/app/app_text_style.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/main.dart';
import 'package:fitnessx/navigation/routes.dart';
import 'package:fitnessx/ui/login/login_provider.dart';
import 'package:fitnessx/utils/common_util.dart';
import 'package:fitnessx/widgets/app_button.dart';
import 'package:fitnessx/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    context.getLocaleString().heyThere,
                    style: AppTextStyle.normal(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    context.getLocaleString().welcomeBack,
                    style: AppTextStyle.bold(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => AppTextField(
                      textController: value.emailController,
                      hintText: context.getLocaleString().email,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.message.svg(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Consumer<LoginProvider>(
                    builder:(ctx,value,child) => AppTextField(
                      showPassword: value.passwordVisible,
                      textController: value.passwordController,
                      hintText: context.getLocaleString().password,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.lock.svg(),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          value.togglePasseord();
                        },
                        icon: Assets.icons.hidePassword.svg(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      scafoldMessengerKey.currentState?.showSnackBar(SnackBar(content: Text("Forgot Password")));
                    },
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.grey),
                    ),
                    child: Text(context.getLocaleString().forgotPassword),
                  ),
                  Spacer(),
                  Consumer(
                    builder: (context, value, child) => AppButton.icon(
                      onClick: () {
                        context.read<LoginProvider>().validate();
                      },
                      icon: Assets.icons.icLogin.svg(),
                      text: context.getLocaleString().login,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // OR Divider
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Or", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
      
                  // Google & Facebook Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Assets.icons.icGoogle.svg()),
                      const SizedBox(width: 16),
                      _socialButton(Assets.icons.icFacebook.svg()),
                    ],
                  ),
                  SizedBox(height: 20,),
                  // Register Link
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(text: context.getLocaleString().donthaveAccount),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.pushNamed(context, Routes.signUp);
                            },
                            text: context.getLocaleString().register,
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(Widget asset) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: asset,
    );
  }
}
