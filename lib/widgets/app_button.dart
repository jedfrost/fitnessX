import 'package:fitnessx/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final Widget? icon; // optional icon
  final bool hasIcon; // to check which constructor is used
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double? width;
  final Gradient? gradient;

  const AppButton({
    super.key,
    required this.onClick,
    required this.text,
    this.padding,
    this.textStyle,
    this.width,
    this.gradient
  })  : icon = null,
        hasIcon = false;

  const AppButton.icon({
    super.key,
    required this.onClick,
    required this.text,
    required this.icon,
    this.padding,
    this.textStyle,
    this.width,
    this.gradient
  }) : hasIcon = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: width ?? double.infinity, // full width by default
        padding: padding ?? EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: gradient ?? AppGradient.blueGradient,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: hasIcon
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon ?? Icon(Icons.usb_rounded),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: textStyle ?? const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Text(
                  text,
                  style: textStyle ?? TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}