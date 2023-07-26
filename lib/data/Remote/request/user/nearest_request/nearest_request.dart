import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/user/nearest_response/nearest_response.dart';
class NearestRequset {
  Future nearestRequset({
    required String token
  }) async {
    try {
      print(token);
      final response = await http.get(
        Uri.parse("$baseUrlUser/$nearest"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
      print(response.body);
      print("sucessrrr");
      return NearestResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}