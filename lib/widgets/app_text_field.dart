import 'package:fitnessx/app/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool showPassword;
  const AppTextField({
    super.key, 
    required this.textController,
    this.prefixIcon,
    this.suffixIcon,
    this.showPassword = false,
    this.hintText = ""
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: showPassword,
      style: AppTextStyle.normal(fontSize: 12),
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        fillColor: Colors.grey.shade100,
      ),
    );
  }
}
