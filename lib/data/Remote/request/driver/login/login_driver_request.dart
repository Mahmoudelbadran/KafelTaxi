import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/driver/login_response/login_driver_response.dart';

class LoginDriverRequest {
  Future loginDriverRequest({
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
        Uri.parse("$baseUrlUser/$driverLogin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      print("hello this api:${response.body}");
        return LoginDriverResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}