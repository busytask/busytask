class UserHistoryModel {
  UserHistoryModel({
    this.success,
    this.message,
    this.data,
  });

  UserHistoryModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.userGainHistory,
    this.userQuizHistory,
  });

  Data.fromJson(dynamic json) {
    if (json['user_gain_history'] != null) {
      userGainHistory = [];
      json['user_gain_history'].forEach((v) {
        userGainHistory?.add(UserGainHistory.fromJson(v));
      });
    }
    if (json['user_quiz_history'] != null) {
      userQuizHistory = [];
      json['user_quiz_history'].forEach((v) {
        userQuizHistory?.add(UserQuizHistory.fromJson(v));
      });
    }
  }
  List<UserGainHistory>? userGainHistory;
  List<UserQuizHistory>? userQuizHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userGainHistory != null) {
      map['user_gain_history'] = userGainHistory?.map((v) => v.toJson()).toList();
    }
    if (userQuizHistory != null) {
      map['user_quiz_history'] = userQuizHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserQuizHistory {
  UserQuizHistory({
    this.id,
    this.userId,
    this.quizId,
    this.amount,
    this.winStatus,
    this.resultStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  UserQuizHistory.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    quizId = json['quiz_id'];
    amount = json['amount'];
    winStatus = json['win_status'];
    resultStatus = json['result_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  dynamic id;
  dynamic userId;
  dynamic quizId;
  dynamic amount;
  dynamic winStatus;
  dynamic resultStatus;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['quiz_id'] = quizId;
    map['amount'] = amount;
    map['win_status'] = winStatus;
    map['result_status'] = resultStatus;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class UserGainHistory {
  UserGainHistory({
    this.id,
    this.userId,
    this.description,
    this.amount,
    this.gainStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  UserGainHistory.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    amount = json['amount'];
    gainStatus = json['gain_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  dynamic id;
  dynamic userId;
  dynamic description;
  dynamic amount;
  dynamic gainStatus;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['description'] = description;
    map['amount'] = amount;
    map['gain_status'] = gainStatus;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
