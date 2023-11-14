import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_app/controller/core_controller.dart';
import 'package:user_app/controller/dashboard/home_screen_controller.dart';
import 'package:user_app/utils/pages.dart';
import 'package:user_app/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(CoreController());
        Get.put(HomeScreenController());
      }),
      initialRoute: SplashScreen.routeName,
      getPages: commonPages,
    );
  }
}
