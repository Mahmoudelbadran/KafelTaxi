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
      List<HistoryAllUser>? history,
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? deviceToken,}){
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
    _deviceToken = deviceToken;
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
        _history?.add(HistoryAllUser.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _deviceToken = json['deviceToken'];
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
  List<HistoryAllUser>? _history;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _deviceToken;

  Location get location => _location??Location();
  String get id => _id??'';
  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get addresses => _addresses??'';
  bool get active => _active??false;
  String get role => _role??'';
  List<HistoryAllUser> get history => _history??[];
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;
  String get deviceToken => _deviceToken??'';

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
    map['deviceToken'] = _deviceToken;
    return map;
  }

}

HistoryAllUser historyFromJson(String str) => HistoryAllUser.fromJson(json.decode(str));
String historyToJson(HistoryAllUser data) => json.encode(data.toJson());
class HistoryAllUser {
  HistoryAllUser({
      String? from, 
      String? to,}){
    _from = from;
    _to = to;
}

  HistoryAllUser.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
  }
  String? _from;
  String? _to;

  String get from => _from??'';
  String get to => _to??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? type, 
      List<num>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? _type;
  List<num>? _coordinates;

  String get type => _type??'';
  List<num> get coordinates => _coordinates??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}