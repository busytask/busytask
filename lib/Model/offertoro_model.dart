class OffertoroModel {
  OffertoroModel({
    Query? query,
    Response? response,
    String? error,
  }) {
    _query = query;
    _response = response;
    _error = error;
  }

  OffertoroModel.fromJson(dynamic json) {
    _query = json['query'] != null ? Query.fromJson(json['query']) : null;
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
    _error = json['error'];
  }

  Query? _query;
  Response? _response;
  String? _error;

  Query? get query => _query;

  Response? get response => _response;

  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_query != null) {
      map['query'] = _query?.toJson();
    }
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    map['error'] = _error;
    return map;
  }
}

class Response {
  Response({
    String? currencyName,
    dynamic offersCount,
    List<Offers>? offers,
  }) {
    _currencyName = currencyName;
    _offersCount = offersCount;
    _offers = offers;
  }

  Response.fromJson(dynamic json) {
    _currencyName = json['currency_name'];
    _offersCount = json['offers_count'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
  }

  String? _currencyName;
  dynamic _offersCount;
  List<Offers>? _offers;

  String? get currencyName => _currencyName;

  dynamic get offersCount => _offersCount;

  List<Offers>? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency_name'] = _currencyName;
    map['offers_count'] = _offersCount;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Offers {
  Offers({
    String? offerId,
    String? offerName,
    String? offerDesc,
    String? callToAction,
    String? disclaimer,
    String? offerUrl,
    String? offerUrlEasy,
    dynamic payout,
    String? payoutType,
    dynamic amount,
    String? imageUrl,
    String? imageUrl220x124,
    List<String>? countries,
    String? platform,
    String? device,
    dynamic lastModified,
    String? finalRating,
    List<Verticals>? verticals,
  }) {
    _offerId = offerId;
    _offerName = offerName;
    _offerDesc = offerDesc;
    _callToAction = callToAction;
    _disclaimer = disclaimer;
    _offerUrl = offerUrl;
    _offerUrlEasy = offerUrlEasy;
    _payout = payout;
    _payoutType = payoutType;
    _amount = amount;
    _imageUrl = imageUrl;
    _imageUrl220x124 = imageUrl220x124;
    _countries = countries;
    _platform = platform;
    _device = device;
    _lastModified = lastModified;
    _finalRating = finalRating;
    _verticals = verticals;
  }

  Offers.fromJson(dynamic json) {
    _offerId = json['offer_id'];
    _offerName = json['offer_name'];
    _offerDesc = json['offer_desc'];
    _callToAction = json['call_to_action'];
    _disclaimer = json['disclaimer'];
    _offerUrl = json['offer_url'];
    _offerUrlEasy = json['offer_url_easy'];
    _payout = json['payout'];
    _payoutType = json['payout_type'];
    _amount = json['amount'];
    _imageUrl = json['image_url'];
    _imageUrl220x124 = json['image_url_220x124'];
    _countries = json['countries'] != null ? json['countries'].cast<String>() : [];
    _platform = json['platform'];
    _device = json['device'];
    _lastModified = json['last_modified'];
    _finalRating = json['final_rating'];
    if (json['verticals'] != null) {
      _verticals = [];
      json['verticals'].forEach((v) {
        _verticals?.add(Verticals.fromJson(v));
      });
    }
  }

  String? _offerId;
  String? _offerName;
  String? _offerDesc;
  String? _callToAction;
  String? _disclaimer;
  String? _offerUrl;
  String? _offerUrlEasy;
  dynamic _payout;
  String? _payoutType;
  dynamic _amount;
  String? _imageUrl;
  String? _imageUrl220x124;
  List<String>? _countries;
  String? _platform;
  String? _device;
  dynamic _lastModified;
  String? _finalRating;
  List<Verticals>? _verticals;

  String? get offerId => _offerId;

  String? get offerName => _offerName;

  String? get offerDesc => _offerDesc;

  String? get callToAction => _callToAction;

  String? get disclaimer => _disclaimer;

  String? get offerUrl => _offerUrl;

  String? get offerUrlEasy => _offerUrlEasy;

  dynamic get payout => _payout;

  String? get payoutType => _payoutType;

  dynamic get amount => _amount;

  String? get imageUrl => _imageUrl;

  String? get imageUrl220x124 => _imageUrl220x124;

  List<String>? get countries => _countries;

  String? get platform => _platform;

  String? get device => _device;

  dynamic get lastModified => _lastModified;

  String? get finalRating => _finalRating;

  List<Verticals>? get verticals => _verticals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offer_id'] = _offerId;
    map['offer_name'] = _offerName;
    map['offer_desc'] = _offerDesc;
    map['call_to_action'] = _callToAction;
    map['disclaimer'] = _disclaimer;
    map['offer_url'] = _offerUrl;
    map['offer_url_easy'] = _offerUrlEasy;
    map['payout'] = _payout;
    map['payout_type'] = _payoutType;
    map['amount'] = _amount;
    map['image_url'] = _imageUrl;
    map['image_url_220x124'] = _imageUrl220x124;
    map['countries'] = _countries;
    map['platform'] = _platform;
    map['device'] = _device;
    map['last_modified'] = _lastModified;
    map['final_rating'] = _finalRating;
    if (_verticals != null) {
      map['verticals'] = _verticals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// vertical_id : "6"
/// vertical_name : "Gaming"

class Verticals {
  Verticals({
    String? verticalId,
    String? verticalName,
  }) {
    _verticalId = verticalId;
    _verticalName = verticalName;
  }

  Verticals.fromJson(dynamic json) {
    _verticalId = json['vertical_id'];
    _verticalName = json['vertical_name'];
  }

  String? _verticalId;
  String? _verticalName;

  String? get verticalId => _verticalId;

  String? get verticalName => _verticalName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vertical_id'] = _verticalId;
    map['vertical_name'] = _verticalName;
    return map;
  }
}

/// pubid : "15768"
/// appid : 14507
/// country : "US"
/// platform : "web"

class Query {
  Query({
    String? pubid,
    dynamic appid,
    String? country,
    String? platform,
  }) {
    _pubid = pubid;
    _appid = appid;
    _country = country;
    _platform = platform;
  }

  Query.fromJson(dynamic json) {
    _pubid = json['pubid'];
    _appid = json['appid'];
    _country = json['country'];
    _platform = json['platform'];
  }

  String? _pubid;
  dynamic _appid;
  String? _country;
  String? _platform;

  String? get pubid => _pubid;

  dynamic get appid => _appid;

  String? get country => _country;

  String? get platform => _platform;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pubid'] = _pubid;
    map['appid'] = _appid;
    map['country'] = _country;
    map['platform'] = _platform;
    return map;
  }
}
