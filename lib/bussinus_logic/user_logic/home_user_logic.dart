import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taxizer/data/Remote/request/user/location_user_request/location_user_request.dart';
import 'package:taxizer/data/Remote/response/user/location_user_response/location_user_response.dart';
import 'dart:ui' as ui;
import 'package:taxizer/presentation/screens/home_screens/user/home/home_user_page.dart';
import 'package:taxizer/presentation/screens/home_screens/user/payment/payment_user_page.dart';
import 'package:taxizer/presentation/screens/home_screens/user/person/person_user_page.dart';
import 'package:taxizer/presentation/screens/home_screens/user/taxi/order_user_page.dart';
import '../../data/Remote/request/user/nearest_request/nearest_request.dart';
import '../../data/Remote/response/user/nearest_response/nearest_response.dart';
import '../../presentation/style/style.dart';
part 'home_user_state.dart';

class HomeUserLogic extends Cubit<HomeUserState> {
  HomeUserLogic() : super(AppIntialStates());

  static HomeUserLogic get(context) => BlocProvider.of<HomeUserLogic>(context);
  List<IconData> iconList = [
    Icons.person_outline,
    Icons.payment,
    Icons.local_taxi_outlined,
    Icons.home_outlined,
  ];

  List<Widget> pages = [
    const PersonUserPage(),
    const PaymentUserPage(),
    const OrderUserPage(),
    const HomeUserPage(),
  ];
  int x = 3;
  Widget changePages() {
    return pages.elementAt(x);
  }

  void changeclickebuton(index) {
    x = index;
    emit(ChangeClickButtonStates());
  }

  String address = "";
  LatLng? pickerLocation;
  LatLng? currentLocation;
  LatLng? goGetLocation;
  LatLng? goGetLocationPointOne;
  GoogleMapController? mapController;
  Future<void> getAddress() async {
    try {
      final List<Placemark> placeMarks = await placemarkFromCoordinates(
          currentLocation!.latitude, currentLocation!.longitude);

      if (placeMarks.isNotEmpty) {
        final Placemark placeMark = placeMarks[0];
        address = "${placeMark.street},${placeMark.country}";

        emit(GetAdressState());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getLocation() async {
    if (currentLocation != null && mapController != null) {
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: currentLocation!,
        zoom: 14,
      )));
    } else {
      return;
    }
    emit(GetLocationState());
  }

  Future<void> gotoLocationUserOne(
      {required Map<String, dynamic> place}) async {
    final double lat = place['lat'];
    final double lng = place['lng'];
    goGetLocationPointOne = LatLng(lat, lng);
    if (mapController != null) {
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: goGetLocationPointOne!,
        zoom: 9,
      )));
      emit(GotoLocationUserState());
    } else {
      return;
    }
    emit(GetLocationState());
  }

  Future<void> gotoLocationUserTwo(
      {required Map<String, dynamic> place}) async {
    final double lat = place['lat'];
    final double lng = place['lng'];
    goGetLocation = LatLng(lat, lng);
    if (mapController != null) {
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: goGetLocation!,
        zoom: 9,
      )));
      emit(GotoLocationUserState());
    } else {
      return;
    }
    emit(GetLocationState());
  }
 double lat=0;
  double lng=0;
  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation = LatLng(position.latitude, position.longitude);
    lat=position.latitude;
    lng=position.longitude;
    emit(GetCurrentLocationState());
  }

  Future<void> requestLocationPermission(BuildContext context) async {
    final PermissionStatus permissionStatus =
        await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      // Permission granted

      return;
    } else {
      // Permission denied, show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
              'You must grant permission to access your location to use this app.'),
          action: SnackBarAction(
            label: 'Grant',
            onPressed: () {
              openAppSettings();
            },
          ),
        ),
      );
    }
    emit(RequestLocationPermissionState());
  }

  bool isBottomSheet = false;
  IconData floatingIcon = Icons.add;
  void changeBottonSheets({required bool isShow, required IconData icon}) {
    isBottomSheet = isShow;
    floatingIcon = icon;
    emit(ShowButtomsheetstates());
  }


String imageDriver='images/car.png';

  Future<Uint8List> getBytesFromAsset(
      {required String path, required int width}) async {
    emit(GetBytesFromAssetState());
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: width,
    );
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }


  Set<Polyline> polyline = <Polyline>{};
  int polylineIdCounter = 1;
  void setPolyline(List<PointLatLng> points) {
    print(points);
    final String polylineIdVal = 'polyline_$polylineIdCounter';
    polylineIdCounter++;
    polyline.clear();
    polyline.add(Polyline(
      polylineId: PolylineId(polylineIdVal),
      width: 6,
      color: ycolor,
      points: points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList(),
    ));
    emit(SetPolylineState());
  }

  LocationUserResponse locationUserResponse = LocationUserResponse();
  void locationUser({
    required String token,
    required String type,
    required double lat,
    required double lng,
  }) async {
    print("this lat,lng:$lat,$lng");
    emit(LoadingLocationUserApiAppState());
    await LocationUserRequest()
        .locationUserRequest(token: token, type: type, lat: lat, lng: lng)
        .then((value) {
          print("sucess lat");
      locationUserResponse = value;
      emit(SuscessLocationUserApiAppState());
    }).catchError((error) {
      emit(ErorrLocationUserApiAppState());
    });
  }
  NearestResponse nearestResponse=NearestResponse();
  void getNearest({
    required String token,
  }) async {
    print("loadingDriver");
    emit(LoadingLocationDriverApiAppState());
    await NearestRequset()
        .nearestRequset(token: token,)
        .then((value) {
      nearestResponse = value;
      print("sucessDriver");
      emit(SuscessLocationDriverApiAppState());
    }).catchError((error) {
      emit(ErorrLocationDriverApiAppState());
    });
  }
}
