class PersonalyModel {
  PersonalyModel({
    int? code,
    String? codeMessage,
    Information? information,
    int? offerCount,
    List<Offers>? offers,
  }) {
    _code = code;
    _codeMessage = codeMessage;
    _information = information;
    _offerCount = offerCount;
    _offers = offers;
  }

  PersonalyModel.fromJson(dynamic json) {
    _code = json['code'];
    _codeMessage = json['code_message'];
    _information = json['information'] != null ? Information.fromJson(json['information']) : null;
    _offerCount = json['offer_count'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }

  int? _code;
  String? _codeMessage;
  Information? _information;
  int? _offerCount;
  List<Offers>? _offers;

  int? get code => _code;

  String? get codeMessage => _codeMessage;

  Information? get information => _information;

  int? get offerCount => _offerCount;

  List<Offers>? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['code_message'] = _codeMessage;
    if (_information != null) {
      map['information'] = _information?.toJson();
    }
    map['offer_count'] = _offerCount;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Offers {
  Offers({
    int? id,
    String? guidelines,
    String? mobileGuidelines,
    String? name,
    int? payment,
    String? description,
    int? forceNewWindow,
    String? currencyFullName,
    String? currencyShortName,
    String? url,
    List<Banners>? banners,
    List<Tags>? tags,
    List<Platforms>? platforms,
  }) {
    _id = id;
    _guidelines = guidelines;
    _mobileGuidelines = mobileGuidelines;
    _name = name;
    _payment = payment;
    _description = description;
    _forceNewWindow = forceNewWindow;
    _currencyFullName = currencyFullName;
    _currencyShortName = currencyShortName;
    _url = url;
    _banners = banners;
    _tags = tags;
    _platforms = platforms;
  }

  Offers.fromJson(dynamic json) {
    _id = json['id'];
    _guidelines = json['guidelines'];
    _mobileGuidelines = json['mobile_guidelines'];
    _name = json['name'];
    _payment = json['payment'];
    _description = json['description'];
    _forceNewWindow = json['force_new_window'];
    _currencyFullName = json['currency_full_name'];
    _currencyShortName = json['currency_short_name'];
    _url = json['url'];
    if (json['banners'] != null) {
      _banners = [];
      json['banners'].forEach((v) {
        _banners?.add(Banners.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    if (json['platforms'] != null) {
      _platforms = [];
      json['platforms'].forEach((v) {
        _platforms?.add(Platforms.fromJson(v));
      });
    }
  }

  int? _id;
  String? _guidelines;
  String? _mobileGuidelines;
  String? _name;
  int? _payment;
  String? _description;
  int? _forceNewWindow;
  String? _currencyFullName;
  String? _currencyShortName;
  String? _url;
  List<Banners>? _banners;
  List<Tags>? _tags;
  List<Platforms>? _platforms;

  int? get id => _id;

  String? get guidelines => _guidelines;

  String? get mobileGuidelines => _mobileGuidelines;

  String? get name => _name;

  int? get payment => _payment;

  String? get description => _description;

  int? get forceNewWindow => _forceNewWindow;

  String? get currencyFullName => _currencyFullName;

  String? get currencyShortName => _currencyShortName;

  String? get url => _url;

  List<Banners>? get banners => _banners;

  List<Tags>? get tags => _tags;

  List<Platforms>? get platforms => _platforms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['guidelines'] = _guidelines;
    map['mobile_guidelines'] = _mobileGuidelines;
    map['name'] = _name;
    map['payment'] = _payment;
    map['description'] = _description;
    map['force_new_window'] = _forceNewWindow;
    map['currency_full_name'] = _currencyFullName;
    map['currency_short_name'] = _currencyShortName;
    map['url'] = _url;
    if (_banners != null) {
      map['banners'] = _banners?.map((v) => v.toJson()).toList();
    }
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_platforms != null) {
      map['platforms'] = _platforms?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Platforms {
  Platforms({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Platforms.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  int? _id;
  String? _name;

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

class Tags {
  Tags({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Tags.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  int? _id;
  String? _name;

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

class Banners {
  Banners({
    String? type,
    String? url,
  }) {
    _type = type;
    _url = url;
  }

  Banners.fromJson(dynamic json) {
    _type = json['type'];
    _url = json['url'];
  }

  String? _type;
  String? _url;

  String? get type => _type;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['url'] = _url;
    return map;
  }
}

class Information {
  Information({
    String? appName,
    int? appId,
    String? virtualCurrency,
    String? country,
  }) {
    _appName = appName;
    _appId = appId;
    _virtualCurrency = virtualCurrency;
    _country = country;
  }

  Information.fromJson(dynamic json) {
    _appName = json['app_name'];
    _appId = json['app_id'];
    _virtualCurrency = json['virtual_currency'];
    _country = json['country'];
  }

  String? _appName;
  int? _appId;
  String? _virtualCurrency;
  String? _country;

  String? get appName => _appName;

  int? get appId => _appId;

  String? get virtualCurrency => _virtualCurrency;

  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app_name'] = _appName;
    map['app_id'] = _appId;
    map['virtual_currency'] = _virtualCurrency;
    map['country'] = _country;
    return map;
  }
}
