import 'dart:convert';
SignupUserResponse signupUserResponseFromJson(String str) => SignupUserResponse.fromJson(json.decode(str));
String signupUserResponseToJson(SignupUserResponse data) => json.encode(data.toJson());
class SignupUserResponse {
  SignupUserResponse({
      String? message, 
      User? user,}){
    _message = message;
    _user = user;
}

  SignupUserResponse.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _message;
  User? _user;

  String get message => _message??'';
  User get user => _user??User();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? userName, 
      String? email, 
      String? password, 
      String? phone, 
      String? addresses, 
      Location? location, 
      bool? active, 
      String? role, 
      String? id, 
      List<dynamic>? history, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _userName = userName;
    _email = email;
    _password = password;
    _phone = phone;
    _addresses = addresses;
    _location = location;
    _active = active;
    _role = role;
    _id = id;
    _history = history;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  User.fromJson(dynamic json) {
    _userName = json['userName'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _addresses = json['addresses'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _active = json['active'];
    _role = json['role'];
    _id = json['_id'];
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
  String? _userName;
  String? _email;
  String? _password;
  String? _phone;
  String? _addresses;
  Location? _location;
  bool? _active;
  String? _role;
  String? _id;
  List<dynamic>? _history;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get addresses => _addresses??'';
  Location? get location => _location;
  bool? get active => _active;
  String get role => _role??'';
  String get id => _id??'';
  List<dynamic> get history => _history??[];
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['addresses'] = _addresses;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['active'] = _active;
    map['role'] = _role;
    map['_id'] = _id;
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