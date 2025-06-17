class WannadsModel {
  WannadsModel({
    String? country,
    List<String>? categories,
    List<String>? devices,
    int? completed,
    String? conversionPoint,
    String? conversionTime,
    String? description,
    int? id,
    String? paymentRequired,
    String? title,
    String? imgUrl,
    String? offerUrl,
    double? revenue,
    String? currency,
    double? virtualCurrencyValue,
    String? virtualCurrency,
    int? sortOrder,
    bool? trending,
    int? minLeads,
  }) {
    _country = country;
    _categories = categories;
    _devices = devices;
    _completed = completed;
    _conversionPoint = conversionPoint;
    _conversionTime = conversionTime;
    _description = description;
    _id = id;
    _paymentRequired = paymentRequired;
    _title = title;
    _imgUrl = imgUrl;
    _offerUrl = offerUrl;
    _revenue = revenue;
    _currency = currency;
    _virtualCurrencyValue = virtualCurrencyValue;
    _virtualCurrency = virtualCurrency;
    _sortOrder = sortOrder;
    _trending = trending;
    _minLeads = minLeads;
  }

  WannadsModel.fromJson(dynamic json) {
    _country = json['country'];
    _categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    _devices = json['devices'] != null ? json['devices'].cast<String>() : [];
    _completed = json['completed'];
    _conversionPoint = json['conversion_point'];
    _conversionTime = json['conversion_time'];
    _description = json['description'];
    _id = json['id'];
    _paymentRequired = json['payment_required'];
    _title = json['title'];
    _imgUrl = json['img_url'];
    _offerUrl = json['offer_url'];
    _revenue = json['revenue'];
    _currency = json['currency'];
    _virtualCurrencyValue = json['virtual_currency_value'];
    _virtualCurrency = json['virtual_currency'];
    _sortOrder = json['sort_order'];
    _trending = json['trending'];
    _minLeads = json['min_leads'];
  }
  String? _country;
  List<String>? _categories;
  List<String>? _devices;
  int? _completed;
  String? _conversionPoint;
  String? _conversionTime;
  String? _description;
  int? _id;
  String? _paymentRequired;
  String? _title;
  String? _imgUrl;
  String? _offerUrl;
  double? _revenue;
  String? _currency;
  double? _virtualCurrencyValue;
  String? _virtualCurrency;
  int? _sortOrder;
  bool? _trending;
  int? _minLeads;

  String? get country => _country;
  List<String>? get categories => _categories;
  List<String>? get devices => _devices;
  int? get completed => _completed;
  String? get conversionPoint => _conversionPoint;
  String? get conversionTime => _conversionTime;
  String? get description => _description;
  int? get id => _id;
  String? get paymentRequired => _paymentRequired;
  String? get title => _title;
  String? get imgUrl => _imgUrl;
  String? get offerUrl => _offerUrl;
  double? get revenue => _revenue;
  String? get currency => _currency;
  double? get virtualCurrencyValue => _virtualCurrencyValue;
  String? get virtualCurrency => _virtualCurrency;
  int? get sortOrder => _sortOrder;
  bool? get trending => _trending;
  int? get minLeads => _minLeads;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['categories'] = _categories;
    map['devices'] = _devices;
    map['completed'] = _completed;
    map['conversion_point'] = _conversionPoint;
    map['conversion_time'] = _conversionTime;
    map['description'] = _description;
    map['id'] = _id;
    map['payment_required'] = _paymentRequired;
    map['title'] = _title;
    map['img_url'] = _imgUrl;
    map['offer_url'] = _offerUrl;
    map['revenue'] = _revenue;
    map['currency'] = _currency;
    map['virtual_currency_value'] = _virtualCurrencyValue;
    map['virtual_currency'] = _virtualCurrency;
    map['sort_order'] = _sortOrder;
    map['trending'] = _trending;
    map['min_leads'] = _minLeads;
    return map;
  }
}
