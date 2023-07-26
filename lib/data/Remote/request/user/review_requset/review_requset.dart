import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../../../core/contant/constant.dart';
import 'package:http/http.dart' as http;

import '../../../response/user/review_response/review_response.dart';
class ReviewRequest {
  Future reviewRequest({
    required String comment,
    required String token
  }) async {
    try {
      Map<String, dynamic> data = {
        'comment': comment,
      };
      final response = await http.post(
        Uri.parse("$baseUrlUser/$comment"),
        headers: {'Content-Type': 'application/json',
      'Authorization':'Bearer $token'
        },
        body: jsonEncode(data),
      );
      return ReviewResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}