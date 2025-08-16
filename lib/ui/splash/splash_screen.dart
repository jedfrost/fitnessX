import 'package:fitnessx/app/app_provider.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     context.read<AppProvider>().checkLoggedIn(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            Assets.icons.fitnestX.svg(width: 200),
            Text(context.getLocaleString().everybodyCanTraing)
          ],
        ),
      ),
    );
  }
}