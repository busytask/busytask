class WithdrawHistoryModel {
  WithdrawHistoryModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  WithdrawHistoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    List<WithdrawInfo>? withdrawInfo,
  }) {
    _withdrawInfo = withdrawInfo;
  }

  Data.fromJson(dynamic json) {
    if (json['withdraw_info'] != null) {
      _withdrawInfo = [];
      json['withdraw_info'].forEach((v) {
        _withdrawInfo?.add(WithdrawInfo.fromJson(v));
      });
    }
  }
  List<WithdrawInfo>? _withdrawInfo;

  List<WithdrawInfo>? get withdrawInfo => _withdrawInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withdrawInfo != null) {
      map['withdraw_info'] = _withdrawInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class WithdrawInfo {
  WithdrawInfo({
    int? id,
    int? userId,
    int? methodId,
    int? currencyConvertId,
    int? coins,
    String? account,
    num? amount,
    int? approveStatus,
    int? status,
    String? createdAt,
    String? updatedAt,
    WithdrawMethods? withdrawMethods,
    CurrencyConvert? currencyConvert,
  }) {
    _id = id;
    _userId = userId;
    _methodId = methodId;
    _currencyConvertId = currencyConvertId;
    _coins = coins;
    _account = account;
    _amount = amount;
    _approveStatus = approveStatus;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _withdrawMethods = withdrawMethods;
    _currencyConvert = currencyConvert;
  }

  WithdrawInfo.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _methodId = json['method_id'];
    _currencyConvertId = json['currency_convert_id'];
    _coins = json['coins'];
    _account = json['account'];
    _amount = json['amount'];
    _approveStatus = json['approve_status'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _withdrawMethods = json['withdraw_methods'] != null ? WithdrawMethods.fromJson(json['withdraw_methods']) : null;
    _currencyConvert = json['currency_convert'] != null ? CurrencyConvert.fromJson(json['currency_convert']) : null;
  }
  int? _id;
  int? _userId;
  int? _methodId;
  int? _currencyConvertId;
  int? _coins;
  String? _account;
  num? _amount;
  int? _approveStatus;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  WithdrawMethods? _withdrawMethods;
  CurrencyConvert? _currencyConvert;

  int? get id => _id;
  int? get userId => _userId;
  int? get methodId => _methodId;
  int? get currencyConvertId => _currencyConvertId;
  int? get coins => _coins;
  String? get account => _account;
  num? get amount => _amount;
  int? get approveStatus => _approveStatus;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  WithdrawMethods? get withdrawMethods => _withdrawMethods;
  CurrencyConvert? get currencyConvert => _currencyConvert;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['method_id'] = _methodId;
    map['currency_convert_id'] = _currencyConvertId;
    map['coins'] = _coins;
    map['account'] = _account;
    map['amount'] = _amount;
    map['approve_status'] = _approveStatus;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_withdrawMethods != null) {
      map['withdraw_methods'] = _withdrawMethods?.toJson();
    }
    if (_currencyConvert != null) {
      map['currency_convert'] = _currencyConvert?.toJson();
    }
    return map;
  }
}

class CurrencyConvert {
  CurrencyConvert({
    int? id,
    int? currencyId,
    int? parCurrency,
    String? coin,
    int? status,
    String? createdAt,
    String? updatedAt,
    Currency? currency,
  }) {
    _id = id;
    _currencyId = currencyId;
    _parCurrency = parCurrency;
    _coin = coin;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
  }

  CurrencyConvert.fromJson(dynamic json) {
    _id = json['id'];
    _currencyId = json['currency_id'];
    _parCurrency = json['par_currency'];
    _coin = json['coin'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  int? _id;
  int? _currencyId;
  int? _parCurrency;
  String? _coin;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  Currency? _currency;

  int? get id => _id;
  int? get currencyId => _currencyId;
  int? get parCurrency => _parCurrency;
  String? get coin => _coin;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Currency? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_id'] = _currencyId;
    map['par_currency'] = _parCurrency;
    map['coin'] = _coin;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    return map;
  }
}

class Currency {
  Currency({
    int? id,
    String? name,
    String? isoCode,
    String? symbol,
    dynamic fullUnitName,
    dynamic subUnitName,
    int? defaulty,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _name = name;
    _isoCode = isoCode;
    _symbol = symbol;
    _fullUnitName = fullUnitName;
    _subUnitName = subUnitName;
    _default = defaulty;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Currency.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isoCode = json['iso_code'];
    _symbol = json['symbol'];
    _fullUnitName = json['full_unit_name'];
    _subUnitName = json['sub_unit_name'];
    _default = json['default'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _isoCode;
  String? _symbol;
  dynamic _fullUnitName;
  dynamic _subUnitName;
  int? _default;
  int? _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get isoCode => _isoCode;
  String? get symbol => _symbol;
  dynamic get fullUnitName => _fullUnitName;
  dynamic get subUnitName => _subUnitName;
  int? get defaulty => _default;
  int? get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['iso_code'] = _isoCode;
    map['symbol'] = _symbol;
    map['full_unit_name'] = _fullUnitName;
    map['sub_unit_name'] = _subUnitName;
    map['default'] = _default;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class WithdrawMethods {
  WithdrawMethods({
    int? id,
    String? name,
    int? minimumAmount,
    String? image,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _minimumAmount = minimumAmount;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  WithdrawMethods.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _minimumAmount = json['minimum_amount'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  int? _minimumAmount;
  String? _image;
  int? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  int? get minimumAmount => _minimumAmount;
  String? get image => _image;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['minimum_amount'] = _minimumAmount;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
