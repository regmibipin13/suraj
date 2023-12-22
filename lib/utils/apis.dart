class Api {
  static const String baseUrl = "https://simon.bipin.codes";
  // static const String baseUrl = "http://alwafiq.test";
  static const String login = "$baseUrl/app/login";
  static const String objectList = "$baseUrl/app/objects?user_id=";
  static const String readList = "$baseUrl/app/readings?object_id=";
  static const String readTypes = "$baseUrl/app/reading-types";
  static const String remarksTypes = "$baseUrl/app/remarks-types";
  static const String addReadings = "$baseUrl/add-readings";
  static const String analytics = "$baseUrl/app/analytics?user_id=";
}
