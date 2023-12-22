import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/image_path.dart';

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
                      child: SvgPicture.asset(
                        ImagePath.home,
                        color: c.currentIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 20,
                      )),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.object,
                        color: c.currentIndex.value == 1
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 25,
                      )),
                  label: "Object",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.profile,
                        color: c.currentIndex.value == 2
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 25,
                      )),
                  label: "Profile",
                ),
              ],
            ),
          )),
    );
  }
}
