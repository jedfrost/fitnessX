import 'package:fitnessx/ui/home/home_screen.dart';
import 'package:fitnessx/ui/login/login_screen.dart';
import 'package:fitnessx/ui/onBoarding/on_boarding_screen.dart';
import 'package:fitnessx/ui/signup/sign_up_screen.dart';
import 'package:fitnessx/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {

  static const String splash  = "/";
  static const String onBoarding = "onBoarding";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String home = "home";

  static Route<dynamic> generateRoutes(RouteSettings route) {
    switch(route.name){
      case splash: {
        return MaterialPageRoute(builder: (context)=> SplashScreen());
      }
      case onBoarding: {
        return MaterialPageRoute(builder:(context)=> OnBoardingScreen());
      }
      case login: {
        return MaterialPageRoute(builder:(context)=> LoginScreen());
      }
      case signUp: {
        return MaterialPageRoute(builder:(context)=> SignUpScreen());
      }
      case home: {
        return MaterialPageRoute(builder: (context)=> HomeScreen());
      }
      default : {
        return MaterialPageRoute(builder:(context)=> Center(child: Text("No Page Found")));
      }
    }
  }
}