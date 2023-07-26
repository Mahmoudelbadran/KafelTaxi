import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/driver/update_driver_response/update_driver_response.dart';
class UpDateDriverRequest {
  Future upDateDriverRequest({
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
        Uri.parse("$baseUrlUser/$updateDriver"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(data),
      );

      return UpdateDriverResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}