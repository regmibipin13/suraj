import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_app/models/reading_types.dart';
import 'package:user_app/models/readings.dart';
import 'package:user_app/models/remarks.dart';
import 'package:user_app/utils/apis.dart';

import 'package:http/http.dart' as http;

import '../controller/core_controller.dart';

class ReadingListRepo {

  static Future<void> getReadingList({

    required String id,
    required Function(List<ReadingList> readings) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      // var coreController = Get.find<CoreController>();
      // var userId = coreController.currentUser.value!.id.toString();
      var headers = {
        "Accept": "application/json",
      };
      var url = Uri.parse('${Api.readList}$id');
      log(url.toString());
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      dynamic data = json.decode(response.body);
      log(data.toString());
      if (response.statusCode == 200) {
        List<ReadingList> readList = readingsListFromJson(data["data"]["data"]);
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

  static Future<void> getReadingTypes({
    required Function(List<ReadingTypes> readings) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var url = Uri.parse(Api.readTypes);
      log(url.toString());
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      dynamic data = json.decode(response.body);
      log(data.toString());
      if (response.statusCode == 200) {
        List<ReadingTypes> readList = readingTypesFromJson(data["data"]);
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

  static Future<void> getRemarks({
    required Function(List<Remarks> remarks) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var url = Uri.parse(Api.remarksTypes);
      log(url.toString());
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      log(data.toString());
      if (response.statusCode == 200) {
        List<Remarks> readList = remarksTypesFromJson(data["data"]);
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

  static Future<void> addReadings(
      {required String startDate,
      required String id,
      required String readlingValue,
      required String remarks,
      required String readingTypeId,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = json.encode({
        "object_id": id,
        "reading_type_id": readingTypeId,
        "reading_value": readlingValue,
        "visit_date": startDate,
        "remarks": remarks,
      });
      var url = Uri.parse(Api.addReadings);
      log(body.toString());
      log(url.toString());
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      dynamic data = json.decode(response.body);
      print(data);
      if (response.statusCode == 200) {
        onSuccess();
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
