import 'dart:convert';
UpdateUserTokenResponse updateUserTokenResponseFromJson(String str) => UpdateUserTokenResponse.fromJson(json.decode(str));
String updateUserTokenResponseToJson(UpdateUserTokenResponse data) => json.encode(data.toJson());
class UpdateUserTokenResponse {
  UpdateUserTokenResponse({
      String? message,}){
    _message = message;
}

  UpdateUserTokenResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}