import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/contant/constant.dart';
import '../../../../../core/end_point/end_point.dart';
import '../../../response/admin/edit_driver_response/edit_driver_response.dart';

class EditDriverRequest {
  Future editDriverRequest({
    required String driverId,
    required bool complete,
    required String token,
  }) async {
    try {
      Map<String, dynamic> data = {
        "driverId": driverId,
        "complete":complete

      };
      final response = await http.patch(
        Uri.parse("$baseUrlUser/$editDriver"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(data),
      );

      return EditDriverResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}