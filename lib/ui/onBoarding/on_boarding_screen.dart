import 'package:fitnessx/app/app_text_style.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/navigation/routes.dart';
import 'package:fitnessx/utils/common_util.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final pageImages = [
    Assets.images.icOnboarding1,
    Assets.images.icOnboarding2,
    Assets.images.icOnboarding3,
    Assets.images.icOnboarding4,
  ];

  String getTitle(BuildContext context,int page){
    if(page == 0){
      return context.getLocaleString().onBoardingTitle1;
    }else if (page == 1) {
      return context.getLocaleString().onBoardingTitle2;
    }else if (page == 2){
      return context.getLocaleString().onBoardingTitle3;
    }else {
      return context.getLocaleString().onBoardingTitle4;
    }
  }

  String getDescription(BuildContext context,int page){
    if(page == 0){
      return context.getLocaleString().onBoardingDesc1;
    }else if (page == 1) {
      return context.getLocaleString().onBoardingDesc2;
    }else if (page == 2){
      return context.getLocaleString().onBoardingDesc3;
    }else {
      return context.getLocaleString().onBoardingDesc4;
    }
  }


  final progress = ValueNotifier(0.0);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value){
                progress.value = (value + 1) * 0.25;
              },
              itemCount: pageImages.length,
              itemBuilder: (ctx,index){
              return Column(children: [
                pageImages[index].image(height: height * .5),
                SizedBox(height: 33,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      getTitle(context, index),
                      style: AppTextStyle.bold(fontSize: 24),
                      ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    getDescription(context, index),
                    style: AppTextStyle.normal(),
                    ),
                ),
                ],);
            }),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.only(right: 30,bottom: 40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                    ValueListenableBuilder(
                      valueListenable: progress,
                      builder: (context, value, child) {
                        return TweenAnimationBuilder<double>(
                      tween: Tween(begin : 0.0,end: value),
                      duration: Duration(milliseconds: 500),
                      builder: (ctx,value,child){
                        return CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          color: Color(0xFF92A3FD),
                          constraints: BoxConstraints(minHeight: 65,minWidth: 65),
                          value: value,
                        );
                      });
                      }
                    ),
                    FloatingActionButton(
                      elevation: 0,
                      backgroundColor: Color(0xFF92A3FD),
                      onPressed: (){
                        if(progress.value < 1){
                          pageController.nextPage(duration: Duration(seconds: 1),curve: Curves.decelerate);
                        }else{
                          Navigator.pushReplacementNamed(context, Routes.login);
                        }
                        
                      },
                      shape: CircleBorder(),
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}