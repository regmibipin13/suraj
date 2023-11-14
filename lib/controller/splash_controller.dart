import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:user_app/controller/core_controller.dart';
import 'package:user_app/views/auth/login/login_screen.dart';
import 'package:user_app/views/dash_screen.dart';

class SplashScreenController extends GetxController {
  final coreController = Get.find<CoreController>();

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        log("yhea samma aayo ");
        if (coreController.isUserLoggedIn()) {

          log("yhea samma aayo 32432423");
          Get.offAndToNamed(DashScreen.routeName);

        } else {
          log("yhea samma aayo dskfjksdl;k");
          Get.offAllNamed(LogInScreen.routeName);
        }
      },
    );
    super.onInit();
  }
}
