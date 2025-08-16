import 'package:fitnessx/app/app_colors.dart';
import 'package:fitnessx/app/app_provider.dart';
import 'package:fitnessx/app/app_text_style.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/widgets/app_button.dart';
import 'package:fitnessx/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.editFieldColor), // Use backgroundColor
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textBlack),
                    onPressed: () {},
                  ),
                  Text(
                    "Profile",
                    style: AppTextStyle.bold(fontSize: 18),
                  ),
                  IconButton.filled(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.editFieldColor), // Use backgroundColor
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.more_horiz_outlined, color: AppColors.textBlack),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: Assets.images.icOnboarding1.image().image
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Stefani Wong",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Lose a Fat Program",
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 45 ,
                    child: AppButton(onClick: (){}, text: "Edit",padding: EdgeInsets.all(0),),
                  )
                  
                ],
              ),

              const SizedBox(height: 20),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat("180cm", "Height"),
                  _buildStat("65kg", "Weight"),
                  _buildStat("22yo", "Age"),
                ],
              ),

              const SizedBox(height: 20),

              // Account Section
              _buildSection(
                title: "Account",
                items: [
                  _buildTile(Icons.person_outline, "Personal Data"),
                  _buildTile(Icons.star_outline, "Achievement"),
                  _buildTile(Icons.history, "Activity History"),
                  _buildTile(Icons.bar_chart_outlined, "Workout Progress"),
                ],
              ),

              const SizedBox(height: 20),

              // Notification Section
              _buildSection(
                title: "Notification",
                items: [
                  Consumer<AppProvider>(
                    builder: (context, value, child) =>  SwitchListTile(
                      contentPadding: EdgeInsets.all(0),
                      value: value.notificationEnabled,
                      onChanged: (_) {
                        value.toggleNotification();
                      },
                      activeTrackColor: AppColors.pink,
                      inactiveTrackColor: AppColors.editFieldColor,
                      // trackColor: WidgetStatePropertyAll(AppColors.pink),
                      title: Row(
                        children: [
                          GradientBackground(
                            gradient: AppGradient.blueGradient,
                             child: Assets.icons.icNotification.svg()
                             ),
                          SizedBox(width: 12),
                          Text("Pop-up Notification"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Other Section
              _buildSection(
                title: "Other",
                items: [
                  _buildTile(Icons.email_outlined, "Contact Us"),
                  _buildTile(Icons.privacy_tip_outlined, "Privacy Policy"),
                  _buildTile(Icons.settings_outlined, "Settings"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildStat(String value, String label) {
    return Card.filled(
      elevation: 10,
      shadowColor: Colors.black.withAlpha(100),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 11),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildSection(
      {required String title, required List<Widget> items}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...items,
        ],
      ),
    );
  }

  static Widget _buildTile(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GradientBackground(
        gradient: AppGradient.blueGradient,
        child: Icon(icon),),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}