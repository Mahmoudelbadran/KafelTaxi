import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/contant/constant.dart';
import '../../../../core/end_point/end_point.dart';
import '../../response/update_user_token_response/update_user_token_response.dart';

class UpdateDriverTokenRequest {
  Future updateDriverTokenRequest({
    required String token,
    required String tokenDevice,

  }) async {
    try {
      Map<String, dynamic> data = {
        "deviceToken":tokenDevice,
      }
      ;
      final response = await http.patch(
        body:jsonEncode(data),
        Uri.parse("$baseUrlUser/$updateUserToken"),
        headers: {'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (kDebugMode) {
        print(response.body);
      }
      return UpdateUserTokenResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}