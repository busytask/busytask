class CheckQuizModel {
  CheckQuizModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  CheckQuizModel.fromJson(dynamic json) {
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

class Data {
  Data({
    UserQuiz? userQuiz,
  }) {
    _userQuiz = userQuiz;
  }

  Data.fromJson(dynamic json) {
    _userQuiz = json['user_quiz'] != null ? UserQuiz.fromJson(json['user_quiz']) : null;
  }
  UserQuiz? _userQuiz;

  UserQuiz? get userQuiz => _userQuiz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userQuiz != null) {
      map['user_quiz'] = _userQuiz?.toJson();
    }
    return map;
  }
}

class UserQuiz {
  UserQuiz({
    int? id,
    int? userId,
    int? quizId,
    int? amount,
    String? winStatus,
    String? resultStatus,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _quizId = quizId;
    _amount = amount;
    _winStatus = winStatus;
    _resultStatus = resultStatus;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  UserQuiz.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _quizId = json['quiz_id'];
    _amount = json['amount'];
    _winStatus = json['win_status'];
    _resultStatus = json['result_status'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  int? _quizId;
  int? _amount;
  String? _winStatus;
  String? _resultStatus;
  int? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  int? get quizId => _quizId;
  int? get amount => _amount;
  String? get winStatus => _winStatus;
  String? get resultStatus => _resultStatus;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['quiz_id'] = _quizId;
    map['amount'] = _amount;
    map['win_status'] = _winStatus;
    map['result_status'] = _resultStatus;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
