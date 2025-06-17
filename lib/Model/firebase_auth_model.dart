class FirebaseAuthModel {
  FirebaseAuthModel({
    num? status,
    num? user,
    String? message,
    String? token,
  }) {
    _status = status;
    _user = user;
    _message = message;
    _token = token;
  }

  FirebaseAuthModel.fromJson(dynamic json) {
    _status = json['status'];
    _user = json['user'];
    _message = json['message'];
    _token = json['token'];
  }
  num? _status;
  num? _user;
  String? _message;
  String? _token;

  num? get status => _status;
  num? get user => _user;
  String? get message => _message;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['user'] = _user;
    map['message'] = _message;
    map['token'] = _token;
    return map;
  }
}
