class WithdrawCurrencyConvertModel {
  WithdrawCurrencyConvertModel({
    this.success,
    this.message,
    this.data,
  });

  WithdrawCurrencyConvertModel.fromJson(dynamic json) {
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
    this.currencyConvertInfo,
  });

  Data.fromJson(dynamic json) {
    if (json['currency_convert_info'] != null) {
      currencyConvertInfo = [];
      json['currency_convert_info'].forEach((v) {
        currencyConvertInfo?.add(CurrencyConvertInfo.fromJson(v));
      });
    }
  }
  List<CurrencyConvertInfo>? currencyConvertInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (currencyConvertInfo != null) {
      map['currency_convert_info'] = currencyConvertInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CurrencyConvertInfo {
  CurrencyConvertInfo({
    this.id,
    this.currencyId,
    this.parCurrency,
    this.coin,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  CurrencyConvertInfo.fromJson(dynamic json) {
    id = json['id'];
    currencyId = json['currency_id'];
    parCurrency = json['par_currency'];
    coin = json['coin'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  num? id;
  num? currencyId;
  num? parCurrency;
  String? coin;
  num? status;
  String? createdAt;
  String? updatedAt;
  Currency? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['currency_id'] = currencyId;
    map['par_currency'] = parCurrency;
    map['coin'] = coin;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (currency != null) {
      map['currency'] = currency?.toJson();
    }
    return map;
  }
}

class Currency {
  Currency({
    this.id,
    this.name,
    this.isoCode,
    this.symbol,
    this.fullUnitName,
    this.subUnitName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Currency.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    isoCode = json['iso_code'];
    symbol = json['symbol'];
    fullUnitName = json['full_unit_name'];
    subUnitName = json['sub_unit_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? isoCode;
  String? symbol;
  dynamic fullUnitName;
  dynamic subUnitName;
  num? status;
  dynamic createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['iso_code'] = isoCode;
    map['symbol'] = symbol;
    map['full_unit_name'] = fullUnitName;
    map['sub_unit_name'] = subUnitName;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
