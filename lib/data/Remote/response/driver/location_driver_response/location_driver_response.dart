import 'dart:convert';
LocationDriverResponse locationDriverResponseFromJson(String str) => LocationDriverResponse.fromJson(json.decode(str));
String locationDriverResponseToJson(LocationDriverResponse data) => json.encode(data.toJson());
class LocationDriverResponse {
  LocationDriverResponse({
      String? message, 
      Driver? driver,}){
    _message = message;
    _driver = driver;
}

  LocationDriverResponse.fromJson(dynamic json) {
    _message = json['message'];
    _driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }
  String? _message;
  Driver? _driver;

  String? get message => _message;
  Driver? get driver => _driver;

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
      Location? location, 
      String? id, 
      String? userName, 
      String? email, 
      String? password, 
      String? phone, 
      String? carType, 
      String? carId, 
      String? listId,
      bool? active, 
      bool? complete, 
      String? role, 
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      String? deviceToken, 
      String? addresses,}){
    _location = location;
    _id = id;
    _userName = userName;
    _email = email;
    _password = password;
    _phone = phone;
    _carType = carType;
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
    _addresses = addresses;
}

  Driver.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
    _userName = json['userName'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _carType = json['carType'];
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
    _addresses = json['addresses'];
  }
  Location? _location;
  String? _id;
  String? _userName;
  String? _email;
  String? _password;
  String? _phone;
  String? _carType;
  String? _carId;
  String? _listId;

  bool? _active;
  bool? _complete;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _deviceToken;
  String? _addresses;

  Location get location => _location??Location();
  String get id => _id??'';
  String get userName => _userName??'';
  String get email => _email??'';
  String get password => _password??'';
  String get phone => _phone??'';
  String get carType => _carType??'';
  String get carId => _carId??'';
  String get listId => _listId??'';
  bool get active => _active??false;
  bool get complete => _complete??false;
  String get role => _role??'';
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;
  String get deviceToken => _deviceToken??'';
  String get addresses => _addresses??'';

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
    map['carType'] = _carType;
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
    map['addresses'] = _addresses;
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