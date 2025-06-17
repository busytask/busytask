class KiwiWallModel {
  KiwiWallModel({
    int? subIdId,
    String? ipAddress,
    String? country,
    String? currency,
    List<Offers>? offers,
  }) {
    _subIdId = subIdId;
    _ipAddress = ipAddress;
    _country = country;
    _currency = currency;
    _offers = offers;
  }

  KiwiWallModel.fromJson(dynamic json) {
    _subIdId = json['sub_id_id'];
    _ipAddress = json['ip_address'];
    _country = json['country'];
    _currency = json['currency'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }

  int? _subIdId;
  String? _ipAddress;
  String? _country;
  String? _currency;
  List<Offers>? _offers;

  int? get subIdId => _subIdId;

  String? get ipAddress => _ipAddress;

  String? get country => _country;

  String? get currency => _currency;

  List<Offers>? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_id_id'] = _subIdId;
    map['ip_address'] = _ipAddress;
    map['country'] = _country;
    map['currency'] = _currency;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Offers {
  Offers({
    dynamic id,
    String? name,
    String? logo,
    String? instructions,
    dynamic amount,
    String? category,
    String? os,
    String? countries,
    String? link,
    dynamic epc,
    dynamic cr,
    bool? clicked,
    dynamic oldAmount,
  }) {
    _id = id;
    _name = name;
    _logo = logo;
    _instructions = instructions;
    _amount = amount;
    _category = category;
    _os = os;
    _countries = countries;
    _link = link;
    _epc = epc;
    _cr = cr;
    _clicked = clicked;
    _oldAmount = oldAmount;
  }

  Offers.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
    _instructions = json['instructions'];
    _amount = json['amount'];
    _category = json['category'];
    _os = json['os'];
    _countries = json['countries'];
    _link = json['link'];
    _epc = json['epc'];
    _cr = json['cr'];
    _clicked = json['clicked'];
    _oldAmount = json['old_amount'];
  }

  dynamic _id;
  String? _name;
  String? _logo;
  String? _instructions;
  dynamic _amount;
  String? _category;
  String? _os;
  String? _countries;
  String? _link;
  dynamic _epc;
  dynamic _cr;
  bool? _clicked;
  dynamic _oldAmount;

  dynamic get id => _id;

  String? get name => _name;

  String? get logo => _logo;

  String? get instructions => _instructions;

  dynamic get amount => _amount;

  String? get category => _category;

  String? get os => _os;

  String? get countries => _countries;

  String? get link => _link;

  dynamic get epc => _epc;

  dynamic get cr => _cr;

  bool? get clicked => _clicked;

  dynamic get oldAmount => _oldAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['logo'] = _logo;
    map['instructions'] = _instructions;
    map['amount'] = _amount;
    map['category'] = _category;
    map['os'] = _os;
    map['countries'] = _countries;
    map['link'] = _link;
    map['epc'] = _epc;
    map['cr'] = _cr;
    map['clicked'] = _clicked;
    map['old_amount'] = _oldAmount;
    return map;
  }
}
