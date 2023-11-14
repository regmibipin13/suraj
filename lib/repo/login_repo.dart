import 'dart:convert';
import 'dart:developer';

import 'package:user_app/models/users.dart';

import 'package:http/http.dart' as http;

import '../../utils/apis.dart';

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(User user, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "email": email,
        "password": password,
      };
      http.Response response =
          await http.post(Uri.parse(Api.login), headers: headers, body: body);

      log("${Api.login} ===================>");
      log(json.encode(body));
      log(response.body);
      dynamic data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        String token = json.encode(data["token"]);
        User user = User.fromJson(data["data"]);
        onSuccess(user, token);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
