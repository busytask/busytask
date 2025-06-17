class UserProfileModel {
  UserProfileModel({
    this.success,
    this.message,
    this.data,
  });

  UserProfileModel.fromJson(dynamic json) {
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
    this.user,
    this.withdrawRequestCount,
    this.referUserCount,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    withdrawRequestCount = json['withdraw_request_count'];
    referUserCount = json['refer_user_count'];
  }
  User? user;
  dynamic withdrawRequestCount;
  dynamic referUserCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['withdraw_request_count'] = withdrawRequestCount;
    map['refer_user_count'] = referUserCount;
    return map;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.refer,
    this.userType,
    this.referCode,
    this.facebookToken,
    this.googleToken,
    this.status,
    this.emailVerifiedAt,
    this.accessDate,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.wallet,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    refer = json['refer'];
    userType = json['user_type'];
    referCode = json['refer_code'];
    facebookToken = json['facebook_token'];
    googleToken = json['google_token'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    accessDate = json['access_date'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  dynamic refer;
  String? userType;
  String? referCode;
  dynamic facebookToken;
  dynamic googleToken;
  dynamic status;
  dynamic emailVerifiedAt;
  dynamic accessDate;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
  Wallet? wallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['refer'] = refer;
    map['user_type'] = userType;
    map['refer_code'] = referCode;
    map['facebook_token'] = facebookToken;
    map['google_token'] = googleToken;
    map['status'] = status;
    map['email_verified_at'] = emailVerifiedAt;
    map['access_date'] = accessDate;
    map['remember_token'] = rememberToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (wallet != null) {
      map['wallet'] = wallet?.toJson();
    }
    return map;
  }
}

class Wallet {
  Wallet({
    this.id,
    this.userId,
    this.balance,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Wallet.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    balance = json['balance'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  dynamic userId;
  dynamic balance;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['balance'] = balance;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
