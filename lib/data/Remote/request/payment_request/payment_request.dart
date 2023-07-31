import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../response/payment_response/payment_response.dart';

class PaymentRequest {
  Future paymentRequest({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrlUser/$payment"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
      );
      return PaymentResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}