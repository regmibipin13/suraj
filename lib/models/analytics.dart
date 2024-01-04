// To parse this JSON data, do
//
//     final analyticsList = analyticsListFromJson(jsonString);

import 'dart:convert';

AnalyticsList analyticsListFromJson(String str) =>
    AnalyticsList.fromJson(json.decode(str));

String analyticsListToJson(AnalyticsList data) => json.encode(data.toJson());

class AnalyticsList {
  final int? totalObjects;
  final int? totalTasksToday;
  final int? totalReadingsSubmittedToday;

  AnalyticsList({
    this.totalObjects,
    this.totalTasksToday,
    this.totalReadingsSubmittedToday,
  });

  factory AnalyticsList.fromJson(Map<String, dynamic> json) => AnalyticsList(
        totalObjects: json["total_objects"],
        totalTasksToday: json["total_tasks_today"],
        totalReadingsSubmittedToday: json["total_readings_submitted_today"],
      );

  Map<String, dynamic> toJson() => {
        "total_objects": totalObjects,
        "total_tasks_today": totalTasksToday,
        "total_readings_submitted_today": totalReadingsSubmittedToday,
      };
}
