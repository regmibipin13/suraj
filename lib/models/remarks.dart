List<Remarks> remarksTypesFromJson(List<dynamic> remarksTypesJson) =>
    List<Remarks>.from(remarksTypesJson
        .map((reTypesListJson) => Remarks.fromJson(reTypesListJson)));

class Remarks {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Remarks({this.id, this.name, this.createdAt, this.updatedAt});

  Remarks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
