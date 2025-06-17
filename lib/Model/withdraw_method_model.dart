class WithdrawMethodModel {
  WithdrawMethodModel({
    this.success,
    this.message,
    this.data,
  });

  WithdrawMethodModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.withdrawMethod,
  });

  Data.fromJson(dynamic json) {
    if (json['withdraw_method'] != null) {
      withdrawMethod = [];
      json['withdraw_method'].forEach((v) {
        withdrawMethod?.add(WithdrawMethod.fromJson(v));
      });
    }
  }
  List<WithdrawMethod>? withdrawMethod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (withdrawMethod != null) {
      map['withdraw_method'] = withdrawMethod?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class WithdrawMethod {
  WithdrawMethod({
    this.id,
    this.name,
    this.minimumAmount,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  WithdrawMethod.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    minimumAmount = json['minimum_amount'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  dynamic name;
  dynamic minimumAmount;
  dynamic image;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['minimum_amount'] = minimumAmount;
    map['image'] = image;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
