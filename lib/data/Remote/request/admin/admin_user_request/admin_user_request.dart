import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/admin/admin_user_response/admin_user_response.dart';
class AdminUserRequest {
  Future adminUserRequest({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrlUser/$adminUser"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
      print(response.body);
      return AdminUserResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}