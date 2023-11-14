import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_app/models/users.dart';
import 'package:user_app/utils/storage_keys.dart';
import 'package:user_app/views/auth/login/login_screen.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  Rx<String> accessToken = " ".obs;

  @override
  void onInit() async {
    log("dsfsdfsdfdsfdsfsdf");
    loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    try {
      currentUser.value = StorageHelper.getUser();
      accessToken.value = StorageHelper.getToken();
    } catch (e) {}
  }

  bool isUserLoggedIn() {
    log("dsfsdfsdfdsfdsfsdfsadas jksdhk");
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.ACCESS_TOKEN, null);
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAllNamed(LogInScreen.routeName);
  }
}
