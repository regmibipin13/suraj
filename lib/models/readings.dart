List<ReadingList> readingsListFromJson(List<dynamic> readingListJson) =>
    List<ReadingList>.from(readingListJson
        .map((readingJson) => ReadingList.fromJson(readingJson)));

class ReadingList {
  int? id;
  String? objectId;
  String? readingTypeId;
  String? readingValue;
  String? visitDate;
  String? remarks;
  String? createdAt;
  String? updatedAt;

  ReadingList(
      {this.id,
      this.objectId,
      this.readingTypeId,
      this.readingValue,
      this.visitDate,
      this.remarks,
      this.createdAt,
      this.updatedAt});

  ReadingList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    readingTypeId = json['reading_type_id'];
    readingValue = json['reading_value'];
    visitDate = json['visit_date'];
    remarks = json['remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object_id'] = objectId;
    data['reading_type_id'] = readingTypeId;
    data['reading_value'] = readingValue;
    data['visit_date'] = visitDate;
    data['remarks'] = remarks;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
