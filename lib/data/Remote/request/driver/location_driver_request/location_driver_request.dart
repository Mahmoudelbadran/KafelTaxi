import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:taxizer/core/end_point/end_point.dart';
import '../../../../../core/contant/constant.dart';
import '../../../response/driver/location_driver_response/location_driver_response.dart';
class LocationDriverRequest {
  Future locationDriverRequest({
    required String type,
    required double lat,
    required double lng,
    required String token,
  }) async {
    try {
      List<num> coordinates=[lat,lng];
      Map<String, dynamic> data = {
        "location":{
          'type': type,
          'coordinates': coordinates,
        }
      };
      final response = await http.patch(
        Uri.parse("$baseUrlUser/$locationDriver"),
        headers: {'Content-Type': 'application/json',
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(data),
      );
      print(token);
      print(response.body);
      return LocationDriverResponse.fromJson(jsonDecode(response.body));

    } catch (error) {
      if (kDebugMode) {
        print("this error api:$error");
      }
    }
  }
}