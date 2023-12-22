import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/views/home_screen.dart';
import '../../views/dashboard/profile/profile_screen.dart';
import '../../views/dashboard/object_screen.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList(
    [
      HomeScreen(),
      ObjectScreen(),
      ProfileScreen(),
    ],
  );

  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
