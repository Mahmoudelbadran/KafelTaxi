import 'dart:convert';
AllDriverResponse allDriverResponseFromJson(String str) => AllDriverResponse.fromJson(json.decode(str));
String allDriverResponseToJson(AllDriverResponse data) => json.encode(data.toJson());
class AllDriverResponse {
  AllDriverResponse({
      String? message, 
      List<ResultAllDriver>? result,}){
    _message = message;
    _result = result;
}

  AllDriverResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(ResultAllDriver.fromJson(v));
      });
    }
  }
  String? _message;
  List<ResultAllDriver>? _result;

  String get message => _message??'';
  List<ResultAllDriver> get result => _result??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

ResultAllDriver resultFromJson(String str) => ResultAllDriver.fromJson(json.decode(str));
String resultToJson(ResultAllDriver data) => json.encode(data.toJson());
class ResultAllDriver {
  ResultAllDriver({
      Location? location, 
      String? userName, 
      String? email, 
      String? password, 
      String? phone, 
      String? carId, 
      String? listId, 
      String? id, 
      bool? active, 
      bool? complete, 
      String? role, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? deviceToken, 
      String? driverId,}){
    _location = location;
    _userName = userName;
    _email = email;
    _password = password;
    _phone = phone;
    _carId = carId;
    _listId = listId;
    _id = id;
    _active = active;
    _complete = complete;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _deviceToken = deviceToken;
    _driverId = driverId;
}

  ResultAllDriver.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _userName = json['userName'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _carId = json['carId'];
    _listId = json['listId'];
    _id = json['id'];
    _active = json['active'];
    _complete = json['complete'];
    _role = json['role'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _deviceToken = json['deviceToken'];
    _driverId = json['driverId'];
  }
  Location? _location;
  String? _userName;
  String? _email;
  String? _password;
  String? _phone;
  String? _carId;
  String? _listId;
  String? _id;
  bool? _active;
  bool? _complete;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _deviceToken;
  String? _driverId;

  Location get location => _location??Location();
  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get carId => _carId??'';
  String get listId => _listId??'';
  String get id => _id??'';
  bool get active => _active??false;
  bool get complete => _complete??false;
  String get role => _role??'';
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;
  String get deviceToken => _deviceToken??'';
  String get driverId => _driverId??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['userName'] = _userName;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['carId'] = _carId;
    map['listId'] = _listId;
    map['id'] = _id;
    map['active'] = _active;
    map['complete'] = _complete;
    map['role'] = _role;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['deviceToken'] = _deviceToken;
    map['driverId'] = _driverId;
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