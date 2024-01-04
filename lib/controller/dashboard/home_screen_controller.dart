import 'package:get/get.dart';
import 'package:user_app/models/analytics.dart';
import 'package:user_app/repo/analytics_repo..dart';
import 'package:user_app/utils/custom_snackbar.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    getAllAnalytics();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  Rx<AnalyticsList?> analyticsListDetail = Rxn();
  void getAllAnalytics() async {
    loading.value = true;
    await AnalyticsRepo.getAnalyticsList(onSuccess: (analyticsList) {
      loading.value = false;
      analyticsListDetail.value = analyticsList;
    }, onError: ((message) {
      loading.value = false;
      CustomSnackBar.error(title: "Analytics", message: message);
    }));
  }
}
