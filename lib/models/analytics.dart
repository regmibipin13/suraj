List<AnalyticsList> analyticsListFromJson(List<dynamic> analyticsListJson) =>
    List<AnalyticsList>.from(analyticsListJson
        .map((analyticsJson) => AnalyticsList.fromJson(analyticsJson)));

class AnalyticsList {
  int? totalObjects;
  int? totalReadingsSubmitted;

  AnalyticsList({this.totalObjects, this.totalReadingsSubmitted});

  AnalyticsList.fromJson(Map<String, dynamic> json) {
    totalObjects = json['total_objects'];
    totalReadingsSubmitted = json['total_readings_submitted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_objects'] = totalObjects;
    data['total_readings_submitted'] = totalReadingsSubmitted;
    return data;
  }
}
