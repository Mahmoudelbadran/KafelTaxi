import 'dart:convert';
AdminDriverResponse adminDriverResponseFromJson(String str) => AdminDriverResponse.fromJson(json.decode(str));
String adminDriverResponseToJson(AdminDriverResponse data) => json.encode(data.toJson());
class AdminDriverResponse {
  AdminDriverResponse({
      String? message, 
      List<AdminDriver>? result,}){
    _message = message;
    _result = result;
}

  AdminDriverResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(AdminDriver.fromJson(v));
      });
    }
  }
  String? _message;
  List<AdminDriver>? _result;

  String get message => _message??'';
  List<AdminDriver> get result => _result??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

AdminDriver resultFromJson(String str) => AdminDriver.fromJson(json.decode(str));
String resultToJson(AdminDriver data) => json.encode(data.toJson());
class AdminDriver {
  AdminDriver({
      Location? location, 
      String? id, 
      String? userName, 
      String? email, 
      String? password, 
      String? phone, 
      String? carId, 
      String? listId,
      bool? active, 
      bool? complete, 
      String? role, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? driverId,}){
    _location = location;
    _id = id;
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
    _driverId = driverId;
}

  AdminDriver.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
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
    _driverId = json['driverId'];
  }
  Location? _location;
  String? _id;
  String? _userName;
  String? _email;
  String? _password;
  String? _phone;
  String? _carId;
  String? _listId;
  bool? _active;
  bool? _complete;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _driverId;

  Location get location => _location??Location();
  String get id => _id??'';
  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get carId => _carId??'';
  String get listId => _listId??'';
  bool get active => _active??false;
  bool get complete => _complete??false;
  String get role => _role??'';
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;
  String get driverId => _driverId??'';

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
    map['carId'] = _carId;
    map['listId'] = _listId;
    map['id'] = _id;
    map['active'] = _active;
    map['complete'] = _complete;
    map['role'] = _role;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
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