/// success : true
/// message : "Get Data Successfully  !"
/// data : {"category_quiz":[{"id":1,"name":"Rhonda Hyde","description":"Sint placeat at cil","image":"https://cashrockettest.acnoo.com/back-end/img/users_image/16862190371494.png","status":1,"created_at":"2023-06-08T10:10:37.000000Z","updated_at":"2023-06-08T10:10:37.000000Z","quizzes":[{"id":2,"category_id":1,"name":"test","image":"https://cashrockettest.acnoo.com/back-end/img/Quiz_image/16862245608532.jpg","paid_status":0,"free_or_paid":null,"reward_point":10,"retake_point":5,"status":1,"created_at":"2023-06-08T11:42:40.000000Z","updated_at":"2023-06-08T11:42:40.000000Z","questions":[{"id":2,"quiz_id":2,"question":"what about 10+10 ?","option_a":"55","option_b":"25","option_c":"34","option_d":"20","answer":"D","image":"https://cashrockettest.acnoo.com/","status":1,"created_at":"2023-06-08T11:44:13.000000Z","updated_at":"2023-06-08T11:44:13.000000Z"}]}]}]}

class QuizModel {
  QuizModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  QuizModel.fromJson(dynamic json) {
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

/// category_quiz : [{"id":1,"name":"Rhonda Hyde","description":"Sint placeat at cil","image":"https://cashrockettest.acnoo.com/back-end/img/users_image/16862190371494.png","status":1,"created_at":"2023-06-08T10:10:37.000000Z","updated_at":"2023-06-08T10:10:37.000000Z","quizzes":[{"id":2,"category_id":1,"name":"test","image":"https://cashrockettest.acnoo.com/back-end/img/Quiz_image/16862245608532.jpg","paid_status":0,"free_or_paid":null,"reward_point":10,"retake_point":5,"status":1,"created_at":"2023-06-08T11:42:40.000000Z","updated_at":"2023-06-08T11:42:40.000000Z","questions":[{"id":2,"quiz_id":2,"question":"what about 10+10 ?","option_a":"55","option_b":"25","option_c":"34","option_d":"20","answer":"D","image":"https://cashrockettest.acnoo.com/","status":1,"created_at":"2023-06-08T11:44:13.000000Z","updated_at":"2023-06-08T11:44:13.000000Z"}]}]}]

class Data {
  Data({
    List<CategoryQuiz>? categoryQuiz,
  }) {
    _categoryQuiz = categoryQuiz;
  }

  Data.fromJson(dynamic json) {
    if (json['category_quiz'] != null) {
      _categoryQuiz = [];
      json['category_quiz'].forEach((v) {
        _categoryQuiz?.add(CategoryQuiz.fromJson(v));
      });
    }
  }
  List<CategoryQuiz>? _categoryQuiz;

  List<CategoryQuiz>? get categoryQuiz => _categoryQuiz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categoryQuiz != null) {
      map['category_quiz'] = _categoryQuiz?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "Rhonda Hyde"
/// description : "Sint placeat at cil"
/// image : "https://cashrockettest.acnoo.com/back-end/img/users_image/16862190371494.png"
/// status : 1
/// created_at : "2023-06-08T10:10:37.000000Z"
/// updated_at : "2023-06-08T10:10:37.000000Z"
/// quizzes : [{"id":2,"category_id":1,"name":"test","image":"https://cashrockettest.acnoo.com/back-end/img/Quiz_image/16862245608532.jpg","paid_status":0,"free_or_paid":null,"reward_point":10,"retake_point":5,"status":1,"created_at":"2023-06-08T11:42:40.000000Z","updated_at":"2023-06-08T11:42:40.000000Z","questions":[{"id":2,"quiz_id":2,"question":"what about 10+10 ?","option_a":"55","option_b":"25","option_c":"34","option_d":"20","answer":"D","image":"https://cashrockettest.acnoo.com/","status":1,"created_at":"2023-06-08T11:44:13.000000Z","updated_at":"2023-06-08T11:44:13.000000Z"}]}]

class CategoryQuiz {
  CategoryQuiz({
    num? id,
    String? name,
    String? description,
    String? image,
    num? status,
    String? createdAt,
    String? updatedAt,
    List<Quizzes>? quizzes,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _quizzes = quizzes;
  }

  CategoryQuiz.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['quizzes'] != null) {
      _quizzes = [];
      json['quizzes'].forEach((v) {
        _quizzes?.add(Quizzes.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _description;
  String? _image;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Quizzes>? _quizzes;

  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Quizzes>? get quizzes => _quizzes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_quizzes != null) {
      map['quizzes'] = _quizzes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// category_id : 1
/// name : "test"
/// image : "https://cashrockettest.acnoo.com/back-end/img/Quiz_image/16862245608532.jpg"
/// paid_status : 0
/// free_or_paid : null
/// reward_point : 10
/// retake_point : 5
/// status : 1
/// created_at : "2023-06-08T11:42:40.000000Z"
/// updated_at : "2023-06-08T11:42:40.000000Z"
/// questions : [{"id":2,"quiz_id":2,"question":"what about 10+10 ?","option_a":"55","option_b":"25","option_c":"34","option_d":"20","answer":"D","image":"https://cashrockettest.acnoo.com/","status":1,"created_at":"2023-06-08T11:44:13.000000Z","updated_at":"2023-06-08T11:44:13.000000Z"}]

class Quizzes {
  Quizzes({
    num? id,
    num? categoryId,
    String? name,
    String? image,
    num? paidStatus,
    dynamic freeOrPaid,
    num? rewardPoint,
    num? retakePoint,
    num? status,
    String? createdAt,
    String? updatedAt,
    List<Questions>? questions,
  }) {
    _id = id;
    _categoryId = categoryId;
    _name = name;
    _image = image;
    _paidStatus = paidStatus;
    _freeOrPaid = freeOrPaid;
    _rewardPoint = rewardPoint;
    _retakePoint = retakePoint;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _questions = questions;
  }

  Quizzes.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _name = json['name'];
    _image = json['image'];
    _paidStatus = json['paid_status'];
    _freeOrPaid = json['free_or_paid'];
    _rewardPoint = json['reward_point'];
    _retakePoint = json['retake_point'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['questions'] != null) {
      _questions = [];
      json['questions'].forEach((v) {
        _questions?.add(Questions.fromJson(v));
      });
    }
  }
  num? _id;
  num? _categoryId;
  String? _name;
  String? _image;
  num? _paidStatus;
  dynamic _freeOrPaid;
  num? _rewardPoint;
  num? _retakePoint;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Questions>? _questions;

  num? get id => _id;
  num? get categoryId => _categoryId;
  String? get name => _name;
  String? get image => _image;
  num? get paidStatus => _paidStatus;
  dynamic get freeOrPaid => _freeOrPaid;
  num? get rewardPoint => _rewardPoint;
  num? get retakePoint => _retakePoint;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Questions>? get questions => _questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['name'] = _name;
    map['image'] = _image;
    map['paid_status'] = _paidStatus;
    map['free_or_paid'] = _freeOrPaid;
    map['reward_point'] = _rewardPoint;
    map['retake_point'] = _retakePoint;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_questions != null) {
      map['questions'] = _questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// quiz_id : 2
/// question : "what about 10+10 ?"
/// option_a : "55"
/// option_b : "25"
/// option_c : "34"
/// option_d : "20"
/// answer : "D"
/// image : "https://cashrockettest.acnoo.com/"
/// status : 1
/// created_at : "2023-06-08T11:44:13.000000Z"
/// updated_at : "2023-06-08T11:44:13.000000Z"

class Questions {
  Questions({
    num? id,
    num? quizId,
    String? question,
    String? optionA,
    String? optionB,
    String? optionC,
    String? optionD,
    String? answer,
    String? image,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _quizId = quizId;
    _question = question;
    _optionA = optionA;
    _optionB = optionB;
    _optionC = optionC;
    _optionD = optionD;
    _answer = answer;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Questions.fromJson(dynamic json) {
    _id = json['id'];
    _quizId = json['quiz_id'];
    _question = json['question'];
    _optionA = json['option_a'];
    _optionB = json['option_b'];
    _optionC = json['option_c'];
    _optionD = json['option_d'];
    _answer = json['answer'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _quizId;
  String? _question;
  String? _optionA;
  String? _optionB;
  String? _optionC;
  String? _optionD;
  String? _answer;
  String? _image;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  num? get quizId => _quizId;
  String? get question => _question;
  String? get optionA => _optionA;
  String? get optionB => _optionB;
  String? get optionC => _optionC;
  String? get optionD => _optionD;
  String? get answer => _answer;
  String? get image => _image;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quiz_id'] = _quizId;
    map['question'] = _question;
    map['option_a'] = _optionA;
    map['option_b'] = _optionB;
    map['option_c'] = _optionC;
    map['option_d'] = _optionD;
    map['answer'] = _answer;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
