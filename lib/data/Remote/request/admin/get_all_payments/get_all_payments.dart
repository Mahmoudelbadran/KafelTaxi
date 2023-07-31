import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/admin/get_all_payment_response/get_all_payment_response.dart';

class GetAllPayment {
  Future getAllPayment({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrlUser/$getPayment"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
      print(response.body);
      return GetAllPaymentResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}