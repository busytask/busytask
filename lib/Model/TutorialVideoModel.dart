class TutorialVideoModel {
  TutorialVideoModel({
    this.status,
    this.message,
    this.data,
  });

  TutorialVideoModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.videoId,
  });

  Data.fromJson(dynamic json) {
    videoId = json['video_id'];
  }

  String? videoId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['video_id'] = videoId;
    return map;
  }
}
