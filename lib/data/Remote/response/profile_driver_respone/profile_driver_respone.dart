import 'dart:convert';
ProfileDriverResponse profileResponseFromJson(String str) => ProfileDriverResponse.fromJson(json.decode(str));
String ProfileDriverResponseToJson(ProfileDriverResponse data) => json.encode(data.toJson());
class ProfileDriverResponse {
  ProfileDriverResponse({
    String? message,
    ProfileResult? result,}){
    _message = message;
    _result = result;
  }

  ProfileDriverResponse.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? ProfileResult.fromJson(json['result']) : null;
  }
  String? _message;
  ProfileResult? _result;

  String get message => _message??'';
  ProfileResult get result => _result??ProfileResult();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

ProfileResult resultFromJson(String str) => ProfileResult.fromJson(json.decode(str));
String resultToJson(ProfileResult data) => json.encode(data.toJson());
class ProfileResult {
  ProfileResult({
    Location? location,
    String? id,
    String? userName,
    String? email,
    String? password,
    String? phone,
    String? addresses,
    bool? active,
    String? role,
    List<History>? history,
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

  ProfileResult.fromJson(dynamic json) {
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
        _history?.add(History.fromJson(v));
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
  List<History>? _history;
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
  List<History> get history => _history??[];
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

History historyFromJson(String str) => History.fromJson(json.decode(str));
String historyToJson(History data) => json.encode(data.toJson());
class History {
  History({
    String? from,
    String? to,}){
    _from = from;
    _to = to;
  }

  History.fromJson(dynamic json) {
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