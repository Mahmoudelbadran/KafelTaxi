import 'dart:convert';
SignupDriverResponse signupDriverResponseFromJson(String str) => SignupDriverResponse.fromJson(json.decode(str));
String signupDriverResponseToJson(SignupDriverResponse data) => json.encode(data.toJson());
class SignupDriverResponse {
  SignupDriverResponse({
      String? message, 
      Driver? driver,}){
    _message = message;
    _driver = driver;
}

  SignupDriverResponse.fromJson(dynamic json) {
    _message = json['message'];
    _driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }
  String? _message;
  Driver? _driver;

  String get message => _message??'';
  Driver get driver => _driver??Driver();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_driver != null) {
      map['driver'] = _driver?.toJson();
    }
    return map;
  }

}

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));
String driverToJson(Driver data) => json.encode(data.toJson());
class Driver {
  Driver({
      String? userName, 
      String? email, 
      String? password, 
      String? phone, 
      String? carType, 
      String? carId, 
      String? listId, 
      String? id, 
      Location? location, 
      String? addresses, 
      bool? active, 
      bool? complete, 
      String? role,
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _userName = userName;
    _email = email;
    _password = password;
    _phone = phone;
    _carType = carType;
    _carId = carId;
    _listId = listId;
    _id = id;
    _location = location;
    _addresses = addresses;
    _active = active;
    _complete = complete;
    _role = role;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Driver.fromJson(dynamic json) {
    _userName = json['userName'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _carType = json['carType'];
    _carId = json['carId'];
    _listId = json['listId'];
    _id = json['id'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _addresses = json['addresses'];
    _active = json['active'];
    _complete = json['complete'];
    _role = json['role'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _userName;
  String? _email;
  String? _password;
  String? _phone;
  String? _carType;
  String? _carId;
  String? _listId;
  String? _id;
  Location? _location;
  String? _addresses;
  bool? _active;
  bool? _complete;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get carType => _carType??'';
  String get carId => _carId??'';
  String get listId => _listId??'';
  String get id => _id??'';
  Location get location => _location??location;
  String get addresses => _addresses??'';
  bool get active => _active??false;
  bool get complete => _complete??false;
  String get role => _role??'';

  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['carType'] = _carType;
    map['carId'] = _carId;
    map['listId'] = _listId;
    map['id'] = _id;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['addresses'] = _addresses;
    map['active'] = _active;
    map['complete'] = _complete;
    map['role'] = _role;
    map['_id'] = _id;
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