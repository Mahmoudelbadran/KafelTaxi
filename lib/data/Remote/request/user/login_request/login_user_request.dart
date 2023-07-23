import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/user/login_user_response/login_user_response.dart';
class LoginUserRequest {
  Future loginUserRequest({
    required String phone,
    required String password,
    required String deviceToken,
  }) async {
    try {
      Map<String, dynamic> data = {
        'phone': phone,
        'password': password,
        'deviceToken':deviceToken
      };
      final response = await http.post(
        Uri.parse("$baseUrlUser/$userLogin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return LoginUserResponse.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}