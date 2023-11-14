import 'package:get/get.dart';
import 'package:user_app/controller/auth/login/login_controller.dart';
import 'package:user_app/views/auth/login/login_screen.dart';
import '../controller/dashboard/dash_screen_controller.dart';
import '../controller/dashboard/home_screen_controller.dart';
import '../controller/dashboard/profile_screen_controller.dart';
import '../controller/splash_controller.dart';
import '../views/dash_screen.dart';
import '../views/splash_screen.dart';

var commonPages = [
  GetPage(
      name: SplashScreen.routeName,
      page: (() => SplashScreen()),
      binding:
          BindingsBuilder(() => Get.lazyPut(() => SplashScreenController()))),
  GetPage(
      name: LogInScreen.routeName,
      page: (() => LogInScreen()),
      binding: BindingsBuilder(() => Get.lazyPut(() => LogInController()))),
  GetPage(
      name: DashScreen.routeName,
      page: (() => DashScreen()),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => DashScreenController());
          Get.lazyPut(() => HomeScreenController());
          Get.lazyPut(() => ProfileScreenController());
        },
      )),
];
