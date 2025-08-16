import 'package:fitnessx/app/app_colors.dart';
import 'package:fitnessx/app/app_text_style.dart';
import 'package:fitnessx/gen/assets.gen.dart';
import 'package:fitnessx/utils/common_util.dart';
import 'package:fitnessx/widgets/app_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        surfaceTintColor: AppColors.background,
        backgroundColor: AppColors.background,
        leadingWidth: MediaQuery.of(context).size.width - 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(context.getLocaleString().welcomeBack,style: AppTextStyle.medium(fontSize: 12,color:Colors.black38),),
              Text("Stefani Wong",style: AppTextStyle.bold(fontSize: 20,color: Colors.black),)
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: Assets.icons.icNotification.svg())
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildBmiCard(),
              const SizedBox(height: 20),
              _buildTodayTargetCard(),
              const SizedBox(height: 30),
              _buildSectionHeader("Activity Status"),
              const SizedBox(height: 20),
              _buildHeartRateCard(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _buildWaterIntakeCard()),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildSleepCard(),
                        _buildCaloriesCard(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildSectionHeader("Workout Progress", isDropdown: true),
              const SizedBox(height: 20),
              _buildWorkoutProgressCard(),
              const SizedBox(height: 30),
              _buildSectionHeader("Latest Workout", isSeeMore: true),
              const SizedBox(height: 20),
              _buildLatestWorkoutList(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildBmiCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.icBmiBanner.image().image,
          fit: BoxFit.fill
        )
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "BMI (Body Mass Index)",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "You have a normal weight",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                AppButton(
                  onClick: () {},
                  width: 95,
                  gradient: AppGradient.pinkGradient,
                  textStyle: AppTextStyle.semiBold(fontSize: 12,color: AppColors.background),
                  text: "view More",
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                startDegreeOffset: -90,
                sections: [
                  PieChartSectionData(
                    gradient: AppGradient.pinkGradient,
                    value: 10.1,
                    titleStyle: AppTextStyle.semiBold(color: Colors.white),
                    showTitle: true,
                    radius: 50,
                  ),
                  PieChartSectionData(
                    color: Colors.white,
                    value: 29.9, // Remaining part to complete the circle
                    showTitle: false,
                    radius: 40,
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayTargetCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Today Target", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          AppButton(
            width: 80,
            onClick: () {},
            padding: EdgeInsets.all(10),
            text: "Check",
            textStyle: AppTextStyle.semiBold(fontSize: 14,color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool isDropdown = false, bool isSeeMore = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        if (isDropdown)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Text("Weekly", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
                Icon(Icons.arrow_drop_down, color: Colors.blue)
              ],
            ),
          ),
        if (isSeeMore)
          const Text("See more", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildHeartRateCard() {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Heart Rate", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text("78 BPM", style: TextStyle(color: Colors.blue.shade300, fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("3mins ago", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3), FlSpot(1, 1), FlSpot(2, 4), FlSpot(3, 2), FlSpot(4, 5),
                      FlSpot(5, 3), FlSpot(6, 4), FlSpot(7, 3.5), FlSpot(8, 4.5),
                    ],
                    isCurved: true,
                    color: Colors.purple.shade300,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple.withOpacity(0.3),
                          Colors.purple.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWaterIntakeCard() {

    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Water Intake", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("4 Liters", style: TextStyle(color: Colors.blue.shade300, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          const Text("Real time updates", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 10),
          _buildWaterTimelineEntry("6am - 8am", "600ml"),
          _buildWaterTimelineEntry("9am - 11am", "500ml", isActive: true),
          _buildWaterTimelineEntry("11am - 2pm", "1000ml"),
          _buildWaterTimelineEntry("2pm - 4pm", "700ml"),
          _buildWaterTimelineEntry("4pm - now", "900ml"),
        ],
      ),
    );
  }

  Widget _buildWaterTimelineEntry(String time, String amount, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.purple.shade200 : Colors.grey.shade300,
              border: Border.all(color: isActive ? Colors.purple : Colors.transparent),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSleepCard() {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sleep", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("8h 20m", style: TextStyle(color: Colors.blue.shade300, fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1.5), FlSpot(1, 2.5), FlSpot(2, 1), FlSpot(3, 3),
                      FlSpot(4, 2), FlSpot(5, 2.8), FlSpot(6, 1.2),
                    ],
                    isCurved: true,
                    color: Colors.blue.shade300,
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaloriesCard() {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Calories", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("760 kCal", style: TextStyle(color: Colors.blue.shade300, fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 25,
                startDegreeOffset: -90,
                sections: [
                  PieChartSectionData(
                    color: Colors.purple.shade200,
                    value: 760, // Consumed
                    showTitle: false,
                    radius: 10,
                  ),
                  PieChartSectionData(
                    color: Colors.grey.shade200,
                    value: 1240, // Remaining
                    showTitle: false,
                    radius: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutProgressCard() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return const FlLine(color: Color(0xffe7e8ec), strokeWidth: 1);
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: bottomTitleWidgets,
                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 40,
                interval: 20,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 20), FlSpot(1, 40), FlSpot(2, 30),
                FlSpot(3, 50), FlSpot(4, 70), FlSpot(5, 92), FlSpot(6, 80),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: [Colors.purple.shade300, Colors.blue.shade300]),
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14);
    Widget text;
    switch (value.toInt()) {
      case 0: text = const Text('Sun', style: style); break;
      case 1: text = const Text('Mon', style: style); break;
      case 2: text = const Text('Tue', style: style); break;
      case 3: text = const Text('Wed', style: style); break;
      case 4: text = const Text('Thu', style: style); break;
      case 5: text = const Text('Fri', style: style); break;
      case 6: text = const Text('Sat', style: style); break;
      default: text = const Text('', style: style); break;
    }
    
    return SideTitleWidget(meta:meta,child: text,);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14);
    String text;
    if (value.toInt() % 20 == 0) {
      text = '${value.toInt()}%';
    } else {
      return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget _buildLatestWorkoutList() {
    return Column(
      children: [
        _buildWorkoutTile("Fullbody Workout", "180 Calories Burn | 20minutes", 0.3),
        const SizedBox(height: 15),
        _buildWorkoutTile("Lowerbody Workout", "200 Calories Burn | 30minutes", 0.4),
        const SizedBox(height: 15),
        _buildWorkoutTile("Ab Workout", "120 Calories Burn | 15minutes", 0.2),
      ],
    );
  }

  Widget _buildWorkoutTile(String title, String subtitle, double progress) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          // Icon Placeholder
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.fitness_center, color: Colors.purple.shade300),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
        ],
      ),
    );
  }
}