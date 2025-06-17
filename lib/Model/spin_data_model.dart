class SpinDataModel {
  SpinDataModel({
    num? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  SpinDataModel.fromJson(dynamic json) {
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
    String? entryFee,
    String? position0,
    String? position1,
    String? position2,
    String? position3,
    String? position4,
    String? position5,
    String? position6,
    String? position7,
    String? position8,
    String? position9,
  }) {
    _entryFee = entryFee;
    _position0 = position0;
    _position1 = position1;
    _position2 = position2;
    _position3 = position3;
    _position4 = position4;
    _position5 = position5;
    _position6 = position6;
    _position7 = position7;
    _position8 = position8;
    _position9 = position9;
  }

  Data.fromJson(dynamic json) {
    _entryFee = json['entry_fee'];
    _position0 = json['position0'];
    _position1 = json['position1'];
    _position2 = json['position2'];
    _position3 = json['position3'];
    _position4 = json['position4'];
    _position5 = json['position5'];
    _position6 = json['position6'];
    _position7 = json['position7'];
    _position8 = json['position8'];
    _position9 = json['position9'];
  }
  String? _entryFee;
  String? _position0;
  String? _position1;
  String? _position2;
  String? _position3;
  String? _position4;
  String? _position5;
  String? _position6;
  String? _position7;
  String? _position8;
  String? _position9;

  String? get entryFee => _entryFee;
  String? get position0 => _position0;
  String? get position1 => _position1;
  String? get position2 => _position2;
  String? get position3 => _position3;
  String? get position4 => _position4;
  String? get position5 => _position5;
  String? get position6 => _position6;
  String? get position7 => _position7;
  String? get position8 => _position8;
  String? get position9 => _position9;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['entry_fee'] = _entryFee;
    map['position0'] = _position0;
    map['position1'] = _position1;
    map['position2'] = _position2;
    map['position3'] = _position3;
    map['position4'] = _position4;
    map['position5'] = _position5;
    map['position6'] = _position6;
    map['position7'] = _position7;
    map['position8'] = _position8;
    map['position9'] = _position9;
    return map;
  }
}
