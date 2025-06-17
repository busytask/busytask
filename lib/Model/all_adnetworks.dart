/// success : true
/// message : "Get Data Successfully !"
/// data : {"adnetwork":[{"id":1,"admob_interstitial_android":"test1","admob_interstitial_ios":"test2","admob_rewarded_android":"test3","admob_rewarded_ad_ios":"test4","applovin_rewarded_ad_android":"test5","applovin_rewarded_ad_ios":"test6","audience_network_rewarded_ad_android":"test7","audience_network_ad_ios":"test8","audience_network_interstitial_android":"test9","audience_network_interstitial_ios":"test10","offertoro_publisher_id":"test11","offertoro_app_id":"test12","offertoro_secret_key":"test13","created_at":null,"updated_at":"2023-03-04T09:01:44.000000Z"}]}

class AllAdnetworks {
  AllAdnetworks({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  AllAdnetworks.fromJson(dynamic json) {
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

/// adnetwork : [{"id":1,"admob_interstitial_android":"test1","admob_interstitial_ios":"test2","admob_rewarded_android":"test3","admob_rewarded_ad_ios":"test4","applovin_rewarded_ad_android":"test5","applovin_rewarded_ad_ios":"test6","audience_network_rewarded_ad_android":"test7","audience_network_ad_ios":"test8","audience_network_interstitial_android":"test9","audience_network_interstitial_ios":"test10","offertoro_publisher_id":"test11","offertoro_app_id":"test12","offertoro_secret_key":"test13","created_at":null,"updated_at":"2023-03-04T09:01:44.000000Z"}]

class Data {
  Data({
    List<Adnetwork>? adnetwork,
  }) {
    _adnetwork = adnetwork;
  }

  Data.fromJson(dynamic json) {
    if (json['adnetwork'] != null) {
      _adnetwork = [];
      json['adnetwork'].forEach((v) {
        _adnetwork?.add(Adnetwork.fromJson(v));
      });
    }
  }
  List<Adnetwork>? _adnetwork;

  List<Adnetwork>? get adnetwork => _adnetwork;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_adnetwork != null) {
      map['adnetwork'] = _adnetwork?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// admob_interstitial_android : "test1"
/// admob_interstitial_ios : "test2"
/// admob_rewarded_android : "test3"
/// admob_rewarded_ad_ios : "test4"
/// applovin_rewarded_ad_android : "test5"
/// applovin_rewarded_ad_ios : "test6"
/// audience_network_rewarded_ad_android : "test7"
/// audience_network_ad_ios : "test8"
/// audience_network_interstitial_android : "test9"
/// audience_network_interstitial_ios : "test10"
/// offertoro_publisher_id : "test11"
/// offertoro_app_id : "test12"
/// offertoro_secret_key : "test13"
/// created_at : null
/// updated_at : "2023-03-04T09:01:44.000000Z"

class Adnetwork {
  Adnetwork({
    int? id,
    String? admobInterstitialAndroid,
    String? admobInterstitialIos,
    String? admobRewardedAndroid,
    String? admobRewardedAdIos,
    String? applovinRewardedAdAndroid,
    String? applovinRewardedAdIos,
    String? audienceNetworkRewardedAdAndroid,
    String? audienceNetworkAdIos,
    String? audienceNetworkInterstitialAndroid,
    String? audienceNetworkInterstitialIos,
    String? offertoroPublisherId,
    String? offertoroAppId,
    String? offertoroSecretKey,
    dynamic createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _admobInterstitialAndroid = admobInterstitialAndroid;
    _admobInterstitialIos = admobInterstitialIos;
    _admobRewardedAndroid = admobRewardedAndroid;
    _admobRewardedAdIos = admobRewardedAdIos;
    _applovinRewardedAdAndroid = applovinRewardedAdAndroid;
    _applovinRewardedAdIos = applovinRewardedAdIos;
    _audienceNetworkRewardedAdAndroid = audienceNetworkRewardedAdAndroid;
    _audienceNetworkAdIos = audienceNetworkAdIos;
    _audienceNetworkInterstitialAndroid = audienceNetworkInterstitialAndroid;
    _audienceNetworkInterstitialIos = audienceNetworkInterstitialIos;
    _offertoroPublisherId = offertoroPublisherId;
    _offertoroAppId = offertoroAppId;
    _offertoroSecretKey = offertoroSecretKey;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Adnetwork.fromJson(dynamic json) {
    _id = json['id'];
    _admobInterstitialAndroid = json['admob_interstitial_android'];
    _admobInterstitialIos = json['admob_interstitial_ios'];
    _admobRewardedAndroid = json['admob_rewarded_android'];
    _admobRewardedAdIos = json['admob_rewarded_ad_ios'];
    _applovinRewardedAdAndroid = json['applovin_rewarded_ad_android'];
    _applovinRewardedAdIos = json['applovin_rewarded_ad_ios'];
    _audienceNetworkRewardedAdAndroid = json['audience_network_rewarded_ad_android'];
    _audienceNetworkAdIos = json['audience_network_ad_ios'];
    _audienceNetworkInterstitialAndroid = json['audience_network_interstitial_android'];
    _audienceNetworkInterstitialIos = json['audience_network_interstitial_ios'];
    _offertoroPublisherId = json['offertoro_publisher_id'];
    _offertoroAppId = json['offertoro_app_id'];
    _offertoroSecretKey = json['offertoro_secret_key'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _admobInterstitialAndroid;
  String? _admobInterstitialIos;
  String? _admobRewardedAndroid;
  String? _admobRewardedAdIos;
  String? _applovinRewardedAdAndroid;
  String? _applovinRewardedAdIos;
  String? _audienceNetworkRewardedAdAndroid;
  String? _audienceNetworkAdIos;
  String? _audienceNetworkInterstitialAndroid;
  String? _audienceNetworkInterstitialIos;
  String? _offertoroPublisherId;
  String? _offertoroAppId;
  String? _offertoroSecretKey;
  dynamic _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get admobInterstitialAndroid => _admobInterstitialAndroid;
  String? get admobInterstitialIos => _admobInterstitialIos;
  String? get admobRewardedAndroid => _admobRewardedAndroid;
  String? get admobRewardedAdIos => _admobRewardedAdIos;
  String? get applovinRewardedAdAndroid => _applovinRewardedAdAndroid;
  String? get applovinRewardedAdIos => _applovinRewardedAdIos;
  String? get audienceNetworkRewardedAdAndroid => _audienceNetworkRewardedAdAndroid;
  String? get audienceNetworkAdIos => _audienceNetworkAdIos;
  String? get audienceNetworkInterstitialAndroid => _audienceNetworkInterstitialAndroid;
  String? get audienceNetworkInterstitialIos => _audienceNetworkInterstitialIos;
  String? get offertoroPublisherId => _offertoroPublisherId;
  String? get offertoroAppId => _offertoroAppId;
  String? get offertoroSecretKey => _offertoroSecretKey;
  dynamic get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['admob_interstitial_android'] = _admobInterstitialAndroid;
    map['admob_interstitial_ios'] = _admobInterstitialIos;
    map['admob_rewarded_android'] = _admobRewardedAndroid;
    map['admob_rewarded_ad_ios'] = _admobRewardedAdIos;
    map['applovin_rewarded_ad_android'] = _applovinRewardedAdAndroid;
    map['applovin_rewarded_ad_ios'] = _applovinRewardedAdIos;
    map['audience_network_rewarded_ad_android'] = _audienceNetworkRewardedAdAndroid;
    map['audience_network_ad_ios'] = _audienceNetworkAdIos;
    map['audience_network_interstitial_android'] = _audienceNetworkInterstitialAndroid;
    map['audience_network_interstitial_ios'] = _audienceNetworkInterstitialIos;
    map['offertoro_publisher_id'] = _offertoroPublisherId;
    map['offertoro_app_id'] = _offertoroAppId;
    map['offertoro_secret_key'] = _offertoroSecretKey;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
