class OgAdsModel {
  OgAdsModel({
    bool? success,
    dynamic error,
    List<Offers>? offers,
  }) {
    _success = success;
    _error = error;
    _offers = offers;
  }

  OgAdsModel.fromJson(dynamic json) {
    _success = json['success'];
    _error = json['error'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }

  bool? _success;
  dynamic _error;
  List<Offers>? _offers;

  bool? get success => _success;

  dynamic get error => _error;

  List<Offers>? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['error'] = _error;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Offers {
  Offers({
    int? offerid,
    String? name,
    String? nameShort,
    String? description,
    String? adcopy,
    String? picture,
    String? payout,
    String? country,
    String? device,
    String? link,
    String? epc,
  }) {
    _offerid = offerid;
    _name = name;
    _nameShort = nameShort;
    _description = description;
    _adcopy = adcopy;
    _picture = picture;
    _payout = payout;
    _country = country;
    _device = device;
    _link = link;
    _epc = epc;
  }

  Offers.fromJson(dynamic json) {
    _offerid = json['offerid'];
    _name = json['name'];
    _nameShort = json['name_short'];
    _description = json['description'];
    _adcopy = json['adcopy'];
    _picture = json['picture'];
    _payout = json['payout'];
    _country = json['country'];
    _device = json['device'];
    _link = json['link'];
    _epc = json['epc'];
  }

  int? _offerid;
  String? _name;
  String? _nameShort;
  String? _description;
  String? _adcopy;
  String? _picture;
  String? _payout;
  String? _country;
  String? _device;
  String? _link;
  String? _epc;

  int? get offerid => _offerid;

  String? get name => _name;

  String? get nameShort => _nameShort;

  String? get description => _description;

  String? get adcopy => _adcopy;

  String? get picture => _picture;

  String? get payout => _payout;

  String? get country => _country;

  String? get device => _device;

  String? get link => _link;

  String? get epc => _epc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offerid'] = _offerid;
    map['name'] = _name;
    map['name_short'] = _nameShort;
    map['description'] = _description;
    map['adcopy'] = _adcopy;
    map['picture'] = _picture;
    map['payout'] = _payout;
    map['country'] = _country;
    map['device'] = _device;
    map['link'] = _link;
    map['epc'] = _epc;
    return map;
  }
}
