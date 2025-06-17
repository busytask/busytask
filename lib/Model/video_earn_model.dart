class VideoEarnModel {
  VideoEarnModel({
    num? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  VideoEarnModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;

  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    num? userId,
    String? videoId,
    String? earnedCoins,
    String? duration,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _userId = userId;
    _videoId = videoId;
    _earnedCoins = earnedCoins;
    _duration = duration;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _videoId = json['video_id'];
    _earnedCoins = json['earned_coins'];
    _duration = json['duration'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  num? _userId;
  String? _videoId;
  String? _earnedCoins;
  String? _duration;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  num? get userId => _userId;
  String? get videoId => _videoId;
  String? get earnedCoins => _earnedCoins;
  String? get duration => _duration;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['video_id'] = _videoId;
    map['earned_coins'] = _earnedCoins;
    map['duration'] = _duration;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
