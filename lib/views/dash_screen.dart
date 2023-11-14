import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard/dash_screen_controller.dart';
import '../utils/colors.dart';

class DashScreen extends StatelessWidget {
  static const String routeName = "/dash-screen";
  final c = Get.put(DashScreenController());

  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => c.pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(() => Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.unselectedGrey,
                  blurRadius: 10.0,
                  offset: Offset(4, 4),
                )
              ],
            ),
            child: BottomNavigationBar(
              elevation: 3,
              backgroundColor: AppColors.extraWhite,
              selectedItemColor: AppColors.primaryColor,
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedItemColor: AppColors.unselectedGrey,
              type: BottomNavigationBarType.fixed,
              currentIndex: c.currentIndex.value,
              onTap: c.onItemTapped,
              iconSize: 24,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: Icon(
                        Icons.home,
                        color: c.currentIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                      )),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: EdgeInsets.only(
                        top: 9,
                      ),
                      child: Icon(
                        Icons.person,
                        color: c.currentIndex.value == 2
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                      )),
                  label: "Profile",
                ),
              ],
            ),
          )),
    );
  }
}
