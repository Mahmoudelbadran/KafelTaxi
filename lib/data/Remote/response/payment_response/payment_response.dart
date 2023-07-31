import 'dart:convert';
PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));
String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());
class PaymentResponse {
  PaymentResponse({
      String? message, 
      Result? result,}){
    _message = message;
    _result = result;
}

  PaymentResponse.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? _message;
  Result? _result;

  String? get message => _message;
  Result? get result => _result;

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
      List<Day>? day, 
      List<Week>? week, 
      List<Month>? month, 
      List<Year>? year,}){
    _day = day;
    _week = week;
    _month = month;
    _year = year;
}

  Result.fromJson(dynamic json) {
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
      String? year,}){
    _year = year;
}

  Year.fromJson(dynamic json) {
    _year = json['year'];
  }
  String? _year;

  String get year => _year??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    return map;
  }

}

Month monthFromJson(String str) => Month.fromJson(json.decode(str));
String monthToJson(Month data) => json.encode(data.toJson());
class Month {
  Month({
      String? month,}){
    _month = month;
}

  Month.fromJson(dynamic json) {
    _month = json['month'];
  }
  String? _month;

  String get month => _month??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = _month;
    return map;
  }

}

Week weekFromJson(String str) => Week.fromJson(json.decode(str));
String weekToJson(Week data) => json.encode(data.toJson());
class Week {
  Week({
      String? week,}){
    _week = week;
}

  Week.fromJson(dynamic json) {
    _week = json['week'];
  }
  String? _week;

  String get week => _week??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['week'] = _week;
    return map;
  }

}

Day dayFromJson(String str) => Day.fromJson(json.decode(str));
String dayToJson(Day data) => json.encode(data.toJson());
class Day {
  Day({
      String? day,}){
    _day = day;
}

  Day.fromJson(dynamic json) {
    _day = json['day'];
  }
  String? _day;

  String get day => _day??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    return map;
  }

}