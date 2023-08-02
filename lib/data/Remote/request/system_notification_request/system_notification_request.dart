import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/contant/constant.dart';
import '../../../../core/end_point/end_point.dart';
import '../../response/system_notification_response/system_notification_response.dart';
class SystemNotificationRequest {
  Future systemNotificationRequest({
    required String token,
    required String driverId,
    required String point1,
    required String point2,
    required double lat,
    required double long,
    required String address,
    required String pointTo1,
    required String pointTo2,
    required double lat1,
    required double long1,
    required String address1,
    required double distance,
  }) async {
    try {
      Map<String, dynamic> data = {
        "driver":driverId,
        "pickupLocation": {
          "point": "POINT($point1 $point2)",
          "lat": lat,
          "long": long,
          "address":address
        },
        "dropoffLocation": {
          "point": "POINT($pointTo1 $pointTo2)",
          "lat": lat1,
          "long": long1,
          "address": address1
        },
        "distance": distance
      }
      ;
      final response = await http.post(
        body:jsonEncode(data),
        Uri.parse("$baseUrlUser/$requestUser"),
        headers: {'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (kDebugMode) {
        print(response.body);
      }
      return SystemNotificationResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}