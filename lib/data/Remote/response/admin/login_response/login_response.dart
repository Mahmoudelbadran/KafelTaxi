import 'dart:convert';
LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      String? message, 
      String? token, 
      Data? data,}){
    _message = message;
    _token = token;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
    _message = json['message'];
    _token = json['token'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  String? _token;
  Data? _data;

  String? get message => _message;
  String? get token => _token;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['token'] = _token;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? userName, 
      String? password, 
      String? role, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _userName = userName;
    _password = password;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _userName = json['userName'];
    _password = json['password'];
    _role = json['role'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _userName;
  String? _password;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get userName => _userName;
  String? get password => _password;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userName'] = _userName;
    map['password'] = _password;
    map['role'] = _role;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}