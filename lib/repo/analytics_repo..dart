import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_app/controller/core_controller.dart';
import 'package:user_app/models/analytics.dart';
import 'package:user_app/utils/apis.dart';
import 'package:http/http.dart' as http;

class AnalyticsRepo {
  static Future<void> getAnalyticsList({
    required Function(AnalyticsList analytics) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var userId = coreController.currentUser.value!.id.toString();
      var headers = {
        "Accept": "application/json",
      };
      var url = Uri.parse('${Api.analytics}$userId');
      log(url.toString());
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      log("analytics");
      log(jsonEncode(data));
      if (response.statusCode == 200) {
        AnalyticsList readList = AnalyticsList.fromJson(data);

        onSuccess(readList);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}
