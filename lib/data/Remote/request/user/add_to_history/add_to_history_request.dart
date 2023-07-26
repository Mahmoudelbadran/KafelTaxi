import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:taxizer/core/end_point/end_point.dart';

import '../../../../../core/contant/constant.dart';
import '../../../response/user/search_history_data/search_data_history_response.dart';
class AddToHistoryUserRequest {
  Future addToHistoryUserRequest({
    required String from,
    required String to,
    required String token
  }) async {
    try {
      Map<String, dynamic> data = {
        'from': from,
        'to': to,
      };
      final response = await http.patch(
        Uri.parse("$baseUrlUser/$addToHistory"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(data),
      );
      print(token);
      return SearchDataHistoryResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}