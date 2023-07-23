import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/driver/signup_driver_response/signup_driver_response.dart';
class SignUpDriverRequest {
  Future signUpDriverRequest({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String addresses,
    required String carType,
    required String carId,
    required String listId,
    required String id,

  }) async {
    try {
      Map<String, dynamic> data = {
        'userName': userName,
        'email': email,
        'phone':phone,
        'password':password,
        'confirmPassword':confirmPassword,
        'addresses':addresses,
        'carType':carType,
        'carId':carId,
        'listId':listId,
        'id':id,
      };
      final response = await http.post(
        Uri.parse("$baseUrlUser/$driverSignUp"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return SignupDriverResponse.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}