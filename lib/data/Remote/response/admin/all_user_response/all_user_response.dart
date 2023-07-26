import 'dart:convert';
AllUserResponse allUserResponseFromJson(String str) => AllUserResponse.fromJson(json.decode(str));
String allUserResponseToJson(AllUserResponse data) => json.encode(data.toJson());
class AllUserResponse {
  AllUserResponse({
      String? message, 
      List<ResultAllUser>? result,}){
    _message = message;
    _result = result;
}

  AllUserResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(ResultAllUser.fromJson(v));
      });
    }
  }
  String? _message;
  List<ResultAllUser>? _result;

  String get message => _message??'';
  List<ResultAllUser> get result => _result??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

ResultAllUser resultFromJson(String str) => ResultAllUser.fromJson(json.decode(str));
String resultToJson(ResultAllUser data) => json.encode(data.toJson());
class ResultAllUser {
  ResultAllUser({
      Location? location, 
      String? id, 
      String? userName, 
      String? email, 
      String? password, 
      String? phone, 
      String? addresses, 
      bool? active, 
      String? role, 
      List<dynamic>? history, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _location = location;
    _id = id;
    _userName = userName;
    _email = email;
    _password = password;
    _phone = phone;
    _addresses = addresses;
    _active = active;
    _role = role;
    _history = history;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  ResultAllUser.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
    _userName = json['userName'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _addresses = json['addresses'];
    _active = json['active'];
    _role = json['role'];
    if (json['history'] != null) {
      _history = [];
      json['history'].forEach((v) {
        _history?.add(v);
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  Location? _location;
  String? _id;
  String? _userName;
  String? _email;
  String? _password;
  String? _phone;
  String? _addresses;
  bool? _active;
  String? _role;
  List<dynamic>? _history;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  Location get location => _location??Location();
  String get id => _id??'';
  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get addresses => _addresses??'';
  bool get active => _active??false;
  String get role => _role??'';
  List<dynamic> get history => _history??[];
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['_id'] = _id;
    map['userName'] = _userName;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['addresses'] = _addresses;
    map['active'] = _active;
    map['role'] = _role;
    if (_history != null) {
      map['history'] = _history?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      List<dynamic>? coordinates,}){
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    if (json['coordinates'] != null) {
      _coordinates = [];
      json['coordinates'].forEach((v) {
        _coordinates?.add(v);
      });
    }
  }
  List<dynamic>? _coordinates;

  List<dynamic> get coordinates => _coordinates??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coordinates != null) {
      map['coordinates'] = _coordinates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}