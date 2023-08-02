import 'dart:convert';
SystemNotificationResponse systemNotificationResponseFromJson(String str) => SystemNotificationResponse.fromJson(json.decode(str));
String systemNotificationResponseToJson(SystemNotificationResponse data) => json.encode(data.toJson());
class SystemNotificationResponse {
  SystemNotificationResponse({
      String? message, 
      Result? result,}){
    _message = message;
    _result = result;
}

  SystemNotificationResponse.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? _message;
  Result? _result;

  String get message => _message??'';
  Result get result => _result??Result();

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
      User? user, 
      Driver? driver, 
      PickupLocation? pickupLocation, 
      DropoffLocation? dropoffLocation, 
      String? status, 
      num? distance, 
      String? createAt, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _user = user;
    _driver = driver;
    _pickupLocation = pickupLocation;
    _dropoffLocation = dropoffLocation;
    _status = status;
    _distance = distance;
    _createAt = createAt;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Result.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    _pickupLocation = json['pickupLocation'] != null ? PickupLocation.fromJson(json['pickupLocation']) : null;
    _dropoffLocation = json['dropoffLocation'] != null ? DropoffLocation.fromJson(json['dropoffLocation']) : null;
    _status = json['status'];
    _distance = json['distance'];
    _createAt = json['createAt'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  User? _user;
  Driver? _driver;
  PickupLocation? _pickupLocation;
  DropoffLocation? _dropoffLocation;
  String? _status;
  num? _distance;
  String? _createAt;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  User get user => _user??User();
  Driver get driver => _driver??Driver();
  PickupLocation get pickupLocation => _pickupLocation??PickupLocation();
  DropoffLocation get dropoffLocation => _dropoffLocation??DropoffLocation();
  String get status => _status??'';
  num get distance => _distance??0;
  String get createAt => _createAt??'';
  String get id => _id??'';
  String get createdAt => _createdAt??'';
  String get updatedAt => _updatedAt??'';
  num get v => _v??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_driver != null) {
      map['driver'] = _driver?.toJson();
    }
    if (_pickupLocation != null) {
      map['pickupLocation'] = _pickupLocation?.toJson();
    }
    if (_dropoffLocation != null) {
      map['dropoffLocation'] = _dropoffLocation?.toJson();
    }
    map['status'] = _status;
    map['distance'] = _distance;
    map['createAt'] = _createAt;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

DropoffLocation dropoffLocationFromJson(String str) => DropoffLocation.fromJson(json.decode(str));
String dropoffLocationToJson(DropoffLocation data) => json.encode(data.toJson());
class DropoffLocation {
  DropoffLocation({
      String? point, 
      num? lat, 
      num? long, 
      String? address,}){
    _point = point;
    _lat = lat;
    _long = long;
    _address = address;
}

  DropoffLocation.fromJson(dynamic json) {
    _point = json['point'];
    _lat = json['lat'];
    _long = json['long'];
    _address = json['address'];
  }
  String? _point;
  num? _lat;
  num? _long;
  String? _address;

  String get point => _point??'';
  num get lat => _lat??0;
  num get long => _long??0;
  String get address => _address??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point'] = _point;
    map['lat'] = _lat;
    map['long'] = _long;
    map['address'] = _address;
    return map;
  }

}

PickupLocation pickupLocationFromJson(String str) => PickupLocation.fromJson(json.decode(str));
String pickupLocationToJson(PickupLocation data) => json.encode(data.toJson());
class PickupLocation {
  PickupLocation({
      String? point, 
      num? lat, 
      num? long, 
      String? address,}){
    _point = point;
    _lat = lat;
    _long = long;
    _address = address;
}

  PickupLocation.fromJson(dynamic json) {
    _point = json['point'];
    _lat = json['lat'];
    _long = json['long'];
    _address = json['address'];
  }
  String? _point;
  num? _lat;
  num? _long;
  String? _address;

  String get point => _point??'';
  num get lat => _lat??0;
  num get long => _long??0;
  String get address => _address??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point'] = _point;
    map['lat'] = _lat;
    map['long'] = _long;
    map['address'] = _address;
    return map;
  }

}

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));
String driverToJson(Driver data) => json.encode(data.toJson());
class Driver {
  Driver({
      String? id, 
      String? userName, 
      String? phone, 
      String? carType, 
      String? listId, 
      String? deviceToken,}){
    _id = id;
    _userName = userName;
    _phone = phone;
    _carType = carType;
    _listId = listId;
    _deviceToken = deviceToken;
}

  Driver.fromJson(dynamic json) {
    _id = json['_id'];
    _userName = json['userName'];
    _phone = json['phone'];
    _carType = json['carType'];
    _listId = json['listId'];
    _deviceToken = json['deviceToken'];
  }
  String? _id;
  String? _userName;
  String? _phone;
  String? _carType;
  String? _listId;
  String? _deviceToken;

  String get id => _id??'';
  String get userName => _userName??'';
  String get phone => _phone??'';
  String get carType => _carType??'';
  String get listId => _listId??'';
  String get deviceToken => _deviceToken??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userName'] = _userName;
    map['phone'] = _phone;
    map['carType'] = _carType;
    map['listId'] = _listId;
    map['deviceToken'] = _deviceToken;
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? id, 
      String? userName, 
      String? phone, 
      String? deviceToken,}){
    _id = id;
    _userName = userName;
    _phone = phone;
    _deviceToken = deviceToken;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _userName = json['userName'];
    _phone = json['phone'];
    _deviceToken = json['deviceToken'];
  }
  String? _id;
  String? _userName;
  String? _phone;
  String? _deviceToken;

  String get id => _id??'';
  String get userName => _userName??'';
  String get phone => _phone??'';
  String get deviceToken => _deviceToken??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userName'] = _userName;
    map['phone'] = _phone;
    map['deviceToken'] = _deviceToken;
    return map;
  }

}