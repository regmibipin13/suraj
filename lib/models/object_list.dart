List<ObjectList> objectListFromJson(List<dynamic> objectListJson) =>
    List<ObjectList>.from(
        objectListJson.map((objectJson) => ObjectList.fromJson(objectJson)));

class ObjectList {
  int? id;
  String? objectId;
  String? contractTransaction;
  String? customer;
  String? invoiceType;
  String? frequency;
  String? objectType;
  String? emirates;
  String? visitingAddress;
  String? city;
  String? contactName;
  String? phone;
  String? email;
  String? remarks;
  String? lastVisitDate;
  String? riderId;
  String? area;
  String? googleAddress;
  String? monthWiseRemarks;
  String? batch;
  String? createdAt;
  String? updatedAt;

  ObjectList(
      {this.id,
      this.objectId,
      this.contractTransaction,
      this.customer,
      this.invoiceType,
      this.frequency,
      this.objectType,
      this.emirates,
      this.visitingAddress,
      this.city,
      this.contactName,
      this.phone,
      this.email,
      this.remarks,
      this.lastVisitDate,
      this.riderId,
      this.area,
      this.googleAddress,
      this.monthWiseRemarks,
      this.batch,
      this.createdAt,
      this.updatedAt});

  ObjectList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    contractTransaction = json['contract_transaction'];
    customer = json['customer'];
    invoiceType = json['invoice_type'];
    frequency = json['frequency'];
    objectType = json['object_type'];
    emirates = json['emirates'];
    visitingAddress = json['visiting_address'];
    city = json['city'];
    contactName = json['contact_name'];
    phone = json['phone'];
    email = json['email'];
    remarks = json['remarks'];
    lastVisitDate = json['last_visit_date'];
    riderId = json['rider_id'];
    area = json['area'];
    googleAddress = json['google_address'];
    monthWiseRemarks = json['month_wise_remarks'];
    batch = json['batch'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object_id'] = objectId;
    data['contract_transaction'] = contractTransaction;
    data['customer'] = customer;
    data['invoice_type'] = invoiceType;
    data['frequency'] = frequency;
    data['object_type'] = objectType;
    data['emirates'] = emirates;
    data['visiting_address'] = visitingAddress;
    data['city'] = city;
    data['contact_name'] = contactName;
    data['phone'] = phone;
    data['email'] = email;
    data['remarks'] = remarks;
    data['last_visit_date'] = lastVisitDate;
    data['rider_id'] = riderId;
    data['area'] = area;
    data['google_address'] = googleAddress;
    data['month_wise_remarks'] = monthWiseRemarks;
    data['batch'] = batch;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
