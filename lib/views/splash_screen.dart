import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/utils/custom_text_style.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  SplashScreen({
    super.key,
  });

  final c = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Alwafiq",
            style: CustomTextStyles.f24W600(color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: CupertinoActivityIndicator(
              radius: 15,
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
