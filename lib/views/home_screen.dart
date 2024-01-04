import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/dashboard/home_screen_controller.dart';
import 'package:user_app/models/analytics.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/utils/custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  HomeScreen({super.key});

  final c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Alwafiq",
            style: CustomTextStyles.f16W600(color: Colors.white),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              c.analyticsListDetail.value = null;
              c.getAllAnalytics();
            },
            child: Obx(() => c.analyticsListDetail.value == null
                ? const Center(child: CircularProgressIndicator())
                : AnalyticsWidget(
                    analyticsList: c.analyticsListDetail.value!))));
  }
}

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({super.key, required this.analyticsList});
  final AnalyticsList analyticsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Text(
                "Total Objects",
                style: CustomTextStyles.f14W600(),
              ),
              Text("${analyticsList.totalObjects ?? ""}"),
            ]),
          ),
          const SizedBox(height: 14),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Text(
                "Total Readings submitted Today",
                style: CustomTextStyles.f14W600(),
              ),
              Text("${analyticsList.totalReadingsSubmittedToday ?? ""}"),
            ]),
          ),
          const SizedBox(height: 14),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Text(
                "Total Tasks Today",
                style: CustomTextStyles.f14W600(),
              ),
              Text("${analyticsList.totalTasksToday ?? ""}"),
            ]),
          ),
        ],
      ),
    );
  }
}
