import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:user_app/controller/core_controller.dart';
import 'package:user_app/controller/dashboard/object_screen_controller.dart';
import 'package:user_app/repo/login_repo.dart';
import 'package:user_app/utils/custom_snackbar.dart';
import 'package:user_app/utils/storage_keys.dart';
import 'package:user_app/views/dash_screen.dart';

class LogInController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  RxBool isChecked = false.obs;
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please Wait ...");
      await LoginRepo.login(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));

          print(json.encode(user.toJson()));
          await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
          Get.put(CoreController()).loadCurrentUser();
          Get.put(ObjectScreenController()).getAllObjectList();
          Get.offAllNamed(DashScreen.routeName);
          CustomSnackBar.success(title: "Login", message: "Login Successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Login", message: message);
        },
      );
    }
  }
}
