import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/utils/custom_text_style.dart';

class ProfileScreenController extends GetxController {
  Rx<Color> button1Color = AppColors.accepted.obs;
  Rx<Color> button2Color = AppColors.lGrey.obs;

  Future<void> showMyDialog(bool isOpening) async {
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isOpening
                    ? 'Are you sure you want to open?'
                    : 'Are you sure you want to close?',
                style: CustomTextStyles.f12W600(),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: Get.width / 3.6,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: AppColors.lGrey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.extraWhite,
                        elevation: 0.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'No',
                        style: CustomTextStyles.f12W400(
                            color: AppColors.textColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: Get.width / 3.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        elevation: 0.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        if (isOpening) {
                          button1Color.value =
                              AppColors.accepted; // Change Open button color
                          button2Color.value =
                              AppColors.lGrey; // Change Close button color

                          button2Color.update;
                          button1Color.update;
                        } else {
                          button1Color.value =
                              AppColors.lGrey; // Change Open button color
                          button2Color.value =
                              AppColors.red; // Change Close button color

                          button2Color.update;
                          button1Color.update;
                        }
                      },
                      child: Text(
                        'Yes',
                        style: CustomTextStyles.f12W400(
                            color: AppColors.extraWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
