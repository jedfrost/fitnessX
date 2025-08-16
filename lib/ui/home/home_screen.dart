import 'package:fitnessx/app/app_colors.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/ui/activity/activity_screen.dart';
import 'package:fitnessx/ui/camera/camera_screen.dart';
import 'package:fitnessx/ui/dashboard/dashboard_screen.dart';
import 'package:fitnessx/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


  final screens = [
    DashboardScreen(),
    ActivityScreen(),
    CameraScreen(),
    ProfileScreen()
  ];

  final selectedTab = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 20,
        
        child: ValueListenableBuilder(
          valueListenable: selectedTab,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {
                  selectedTab.value = 0;
                },icon: (selectedTab.value == 0) ? Assets.icons.icHomeSelected.svg() : Assets.icons.icHome.svg()),
                IconButton(onPressed: () {
                  selectedTab.value = 1;
                },icon: (selectedTab.value == 1) ? Assets.icons.icActivitySelected.svg() :  Assets.icons.icActivity.svg()),
                SizedBox(width: 24,),
                IconButton(onPressed: () {
                  selectedTab.value = 2;
                },icon: (selectedTab.value == 2) ? Assets.icons.icCameraSelected.svg() : Assets.icons.icCamera.svg()),
                IconButton(onPressed: () {
                  selectedTab.value = 3;
                },icon: (selectedTab.value == 3) ? Assets.icons.icProfileSelected.svg() : Assets.icons.icProfile.svg()),
              ],
            );
          }
        ),
      ),
      floatingActionButton: 
          Container(
            padding: EdgeInsets.all(10),
            
            decoration:BoxDecoration(
              boxShadow: [BoxShadow(
                blurRadius: 20,
                color: Colors.black.withAlpha(50),
                blurStyle: BlurStyle.outer
              )],
            shape: BoxShape.circle,
            gradient: AppGradient.pinkGradient
          ),
          child: IconButton(
            onPressed:(){},icon: Assets.icons.icSearch.svg())
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedTab,
          builder: (context, value, child) {
            return IndexedStack(
              index: value,
              children: screens,
            );
          }
        ),
      ),
    );
  }
}