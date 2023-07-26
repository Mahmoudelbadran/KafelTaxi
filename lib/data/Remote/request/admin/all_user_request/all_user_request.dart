import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/admin/all_user_response/all_user_response.dart';



class AllUserRequest {
  Future allUserRequest({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrlUser/$allUsers"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
      print(response.body);
      return AllUserResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}