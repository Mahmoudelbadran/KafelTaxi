import 'package:google_maps_flutter/google_maps_flutter.dart';

const baseurl='https://maps.googleapis.com/maps/api';
const baseUrlUser='https://kafyl.onrender.com';
CameraPosition initialCameraPosition=const  CameraPosition(
    target: LatLng(
        25.07725, 55.30927),
    zoom: 15,
);