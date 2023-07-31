import 'dart:convert';
GetAllPaymentResponse getAllPaymentResponseFromJson(String str) => GetAllPaymentResponse.fromJson(json.decode(str));
String getAllPaymentResponseToJson(GetAllPaymentResponse data) => json.encode(data.toJson());
class GetAllPaymentResponse {
  GetAllPaymentResponse({
      String? message,
    AllPayment? result,}){
    _message = message;
    _result = result;
}

  GetAllPaymentResponse.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? AllPayment.fromJson(json['result']) : null;
  }
  String? _message;
  AllPayment? _result;

  String get message => _message??'';
  AllPayment get result => _result??AllPayment();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

AllPayment resultFromJson(String str) => AllPayment.fromJson(json.decode(str));
String resultToJson(AllPayment data) => json.encode(data.toJson());
class AllPayment {
  AllPayment({
      List<Day>? day, 
      List<Week>? week, 
      List<Month>? month, 
      List<Year>? year,}){
    _day = day;
    _week = week;
    _month = month;
    _year = year;
}

  AllPayment.fromJson(dynamic json) {
    if (json['day'] != null) {
      _day = [];
      json['day'].forEach((v) {
        _day?.add(Day.fromJson(v));
      });
    }
    if (json['week'] != null) {
      _week = [];
      json['week'].forEach((v) {
        _week?.add(Week.fromJson(v));
      });
    }
    if (json['month'] != null) {
      _month = [];
      json['month'].forEach((v) {
        _month?.add(Month.fromJson(v));
      });
    }
    if (json['year'] != null) {
      _year = [];
      json['year'].forEach((v) {
        _year?.add(Year.fromJson(v));
      });
    }
  }
  List<Day>? _day;
  List<Week>? _week;
  List<Month>? _month;
  List<Year>? _year;

  List<Day> get day => _day??[];
  List<Week> get week => _week??[];
  List<Month> get month => _month??[];
  List<Year> get year => _year??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_day != null) {
      map['day'] = _day?.map((v) => v.toJson()).toList();
    }
    if (_week != null) {
      map['week'] = _week?.map((v) => v.toJson()).toList();
    }
    if (_month != null) {
      map['month'] = _month?.map((v) => v.toJson()).toList();
    }
    if (_year != null) {
      map['year'] = _year?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Year yearFromJson(String str) => Year.fromJson(json.decode(str));
String yearToJson(Year data) => json.encode(data.toJson());
class Year {
  Year({
      num? year, 
      String? date,}){
    _year = year;
    _date = date;
}

  Year.fromJson(dynamic json) {
    _year = json['year'];
    _date = json['date'];
  }
  num? _year;
  String? _date;

  num get year => _year??0;
  String get date => _date??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    map['date'] = _date;
    return map;
  }

}

Month monthFromJson(String str) => Month.fromJson(json.decode(str));
String monthToJson(Month data) => json.encode(data.toJson());
class Month {
  Month({
      num? month, 
      String? date,}){
    _month = month;
    _date = date;
}

  Month.fromJson(dynamic json) {
    _month = json['month'];
    _date = json['date'];
  }
  num? _month;
  String? _date;

  num get month => _month??0;
  String get date => _date??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = _month;
    map['date'] = _date;
    return map;
  }

}

Week weekFromJson(String str) => Week.fromJson(json.decode(str));
String weekToJson(Week data) => json.encode(data.toJson());
class Week {
  Week({
      num? week, 
      String? date,}){
    _week = week;
    _date = date;
}

  Week.fromJson(dynamic json) {
    _week = json['week'];
    _date = json['date'];
  }
  num? _week;
  String? _date;

  num get week => _week??0;
  String get date => _date??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['week'] = _week;
    map['date'] = _date;
    return map;
  }

}

Day dayFromJson(String str) => Day.fromJson(json.decode(str));
String dayToJson(Day data) => json.encode(data.toJson());
class Day {
  Day({
      num? day, 
      String? date,}){
    _day = day;
    _date = date;
}

  Day.fromJson(dynamic json) {
    _day = json['day'];
    _date = json['date'];
  }
  num? _day;
  String? _date;

  num get day => _day??0;
  String get date => _date??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['date'] = _date;
    return map;
  }

}