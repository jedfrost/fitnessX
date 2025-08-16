import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {

  static TextStyle semiBold({Color color = Colors.black,double fontSize = 14}) => GoogleFonts.poppins(color: color,fontSize: fontSize,fontWeight: FontWeight.w600);
  static TextStyle bold({Color color = Colors.black,double fontSize = 14}) => GoogleFonts.poppins(color: color,fontSize: fontSize,fontWeight: FontWeight.w700);
  static TextStyle medium({Color color = Colors.black,double fontSize = 14}) => GoogleFonts.poppins(color: color,fontSize: fontSize,fontWeight: FontWeight.w500);
  static TextStyle normal({Color color = Colors.black,double fontSize = 14}) => GoogleFonts.poppins(color: color,fontSize: fontSize,fontWeight: FontWeight.w400);
  static TextStyle thin({Color color = Colors.black,double fontSize = 14}) => GoogleFonts.poppins(color: color,fontSize: fontSize,fontWeight: FontWeight.w300);
}