import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:taxizer/core/contant/constant.dart';
import 'package:taxizer/core/end_point/end_point.dart';

import '../../../response/admin/login_response/login_response.dart';

import 'package:http/http.dart' as http;

class LoginRequest {
  Future loginRequest({
    required String username,
    required String password,
  }) async {
    try {
      Map<String, dynamic> data = {
        'userName': username,
        'password': password,
      };
      final response = await http.post(
        Uri.parse("$baseUrlUser/$adminLogin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return LoginResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      if (kDebugMode) {
      }
    }
  }
}