import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/user/update_user_response/update_user_response.dart';

class UpDateUserRequest {
  Future upDateUserRequest({
    required String email,
    required String password,
    required String confirmPassword,
    required String addresses,
    required String token,
  }) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
        'confirmPassword':confirmPassword,
        'addresses':addresses,

      };
      final response = await http.patch(
        Uri.parse("$baseUrlUser/$updateUser"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(data),
      );

      return UpdateUserResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}