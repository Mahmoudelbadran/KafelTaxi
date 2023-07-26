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
      String? day, 
      String? week, 
      String? month, 
      String? year,}){
    _day = day;
    _week = week;
    _month = month;
    _year = year;
}

  Result.fromJson(dynamic json) {
    _day = json['day'];
    _week = json['week'];
    _month = json['month'];
    _year = json['year'];
  }
  String? _day;
  String? _week;
  String? _month;
  String? _year;

  String? get day => _day;
  String? get week => _week;
  String? get month => _month;
  String? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['week'] = _week;
    map['month'] = _month;
    map['year'] = _year;
    return map;
  }

}