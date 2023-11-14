import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_app/models/object_list.dart';
import 'package:user_app/utils/apis.dart';

import 'package:http/http.dart' as http;

import '../controller/core_controller.dart';

class ObjectListRepo {
  static Future<void> getObjectList({
    required Function(List<ObjectList> obj) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var userId = coreController.currentUser.value!.id.toString();
      var headers = {
        "Accept": "application/json",
      };
      var url = Uri.parse('${Api.objectList}$userId');
      log(url.toString());
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      dynamic data = json.decode(response.body);
      log(data.toString());
      if (response.statusCode == 200) {
        List<ObjectList> objList = objectListFromJson(data["data"]["data"]);
        onSuccess(objList);
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
