import 'dart:convert';
ReviewResponse reviewResponseFromJson(String str) => ReviewResponse.fromJson(json.decode(str));
String reviewResponseToJson(ReviewResponse data) => json.encode(data.toJson());
class ReviewResponse {
  ReviewResponse({
      String? message, 
      Result? result,}){
    _message = message;
    _result = result;
}

  ReviewResponse.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? _message;
  Result? _result;

  String? get message => _message;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      String? user, 
      String? comment, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _user = user;
    _comment = comment;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Result.fromJson(dynamic json) {
    _user = json['user'];
    _comment = json['comment'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _user;
  String? _comment;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get user => _user;
  String? get comment => _comment;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['comment'] = _comment;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}