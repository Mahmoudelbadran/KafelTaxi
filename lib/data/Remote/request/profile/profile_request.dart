import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../response/profile_response/profile_response.dart';


class ProfileRequest {
  Future profileRequest({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrlUser/$profile"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
    print(response.body);
      return ProfileResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}