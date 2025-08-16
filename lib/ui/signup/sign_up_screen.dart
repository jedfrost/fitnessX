import 'package:fitnessx/app/app_colors.dart';
import 'package:fitnessx/app/app_text_style.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/utils/common_util.dart';
import 'package:fitnessx/widgets/app_button.dart';
import 'package:fitnessx/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final termsAccepted = ValueNotifier(false);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: true,
    backgroundColor: AppColors.background,
    body: SafeArea(
      child: Form(
        child: Column(
          children: [
            /// TOP SECTION (scrollable)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    /// Greeting
                    Text(
                      context.getLocaleString().heyThere,
                      style: AppTextStyle.normal(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      context.getLocaleString().createAnAccount,
                      style: AppTextStyle.bold(fontSize: 20),
                    ),
                    const SizedBox(height: 30),

                    /// First Name
                    AppTextField(
                      textController: firstNameController,
                      hintText: context.getLocaleString().firstName,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.icProfile.svg(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    /// Last Name
                    AppTextField(
                      textController: lastNameController,
                      hintText: context.getLocaleString().lastName,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.icProfile.svg(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    /// Email
                    AppTextField(
                      textController: emailController,
                      hintText: context.getLocaleString().email,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.message.svg(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    /// Password
                    AppTextField(
                      textController: passwordController,
                      hintText: context.getLocaleString().password,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.lock.svg(),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Assets.icons.hidePassword.svg(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    /// Privacy Policy
                    Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: termsAccepted,
                          builder: (context, value, child) {
                            return Checkbox(
                              value: value,
                              onChanged: (val) {
                                termsAccepted.value = !termsAccepted.value;
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            context.getLocaleString().termsCondition,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// BOTTOM SECTION (fixed)
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    onClick: () {
                      // handle register click
                    },
                    text: context.getLocaleString().register,
                  ),
                  const SizedBox(height: 30),

                  /// OR Divider
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

                  /// Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Assets.icons.icGoogle.svg()),
                      const SizedBox(width: 16),
                      _socialButton(Assets.icons.icFacebook.svg()),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// Login Link
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                            text: context.getLocaleString().alreadyHaveAccount,
                          ),
                          TextSpan(
                            text: context.getLocaleString().login,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _socialButton(Widget asset) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: asset,
  );
}

}