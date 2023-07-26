import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../response/profile_driver_respone/profile_driver_respone.dart';
class ProfileDriverRequest {
  Future profileDriverRequest({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrlUser/$profileDriver"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
      print(response.body);
      return ProfileDriverResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}