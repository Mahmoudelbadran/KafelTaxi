import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/user/signup_response/signup_user_response.dart';
import 'package:http/http.dart' as http;
class SignUpUserRequest {
  Future signUpUserRequest({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String addresses,
  }) async {
    try {
      Map<String, dynamic> data = {
        'userName': userName,
        'email': email,
        'phone':phone,
        'password':password,
        'confirmPassword':confirmPassword,
        'addresses':addresses,
      };
      final response = await http.post(
        Uri.parse("$baseUrlUser/$userSignUp"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
        return SignupUserResponse.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}