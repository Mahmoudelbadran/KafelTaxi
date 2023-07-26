import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;
part 'system_state.dart';
class SystemLogic extends Cubit<SystemState> {
  SystemLogic() : super(AppIntialStates());
  String api='AIzaSyBiwJzCZCed-6o7mD4mZnC92dhB2KxJWMs';
  static SystemLogic get(context) => BlocProvider.of<SystemLogic>(context);
  Future<Map<String, dynamic>> fetchDirection({required String origin,required String destination}) async {
    emit(LoadingDirectionState());
    final response = await http.get(
      Uri.parse(
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$api'
      ),
    );

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      if (json.containsKey('routes') && json['routes'].isNotEmpty) {
        var route = json['routes'][0];
        if (route.containsKey('legs') && route['legs'] is List && route['legs'].isNotEmpty) {
          var legs = route['legs'][0];
          var distanceText = legs['distance'] != null ? legs['distance']['text'] : '';
          var durationText = legs['duration'] != null ? legs['duration']['text'] : '';
          var result = {
            'bounds_ne': route['bounds']['northeast'],
            'bounds_sw': route['bounds']['southwest'],
            'start_location': legs['start_location'],
            'end_location': legs['end_location'],
            'distance': distanceText,
            'duration': durationText,
            'polyline': route['overview_polyline']['points'],
            'polyline_decode': PolylinePoints().decodePolyline(route['overview_polyline']['points']),
          };
          emit(SucessDirectionState());
          return result;
        }
        throw Exception('No legs found in the route');
      }
      throw Exception('No routes found');
    } else {
      throw Exception('Failed to fetch directions');
    }
  }


}