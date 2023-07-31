import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxizer/data/Remote/response/driver/location_driver_response/location_driver_response.dart';
import 'package:taxizer/data/Remote/response/driver/update_driver_response/update_driver_response.dart';
import 'package:taxizer/data/Remote/response/profile_driver_respone/profile_driver_respone.dart';
import 'package:taxizer/presentation/screens/home_screens/driver/home/Home_driver_page.dart';

import 'dart:ui' as ui;
import '../../data/Remote/request/driver/location_driver_request/location_driver_request.dart';
import '../../data/Remote/request/driver/update_request/update_driver_request.dart';
import '../../data/Remote/request/profile_driver/profile_driver.dart';
import '../../presentation/screens/home_screens/driver/profile/profile_driver.dart';
import '../../presentation/screens/home_screens/user/payment/payment_user_page.dart';
import '../../presentation/screens/home_screens/user/taxi/order_user_page.dart';
import '../../presentation/style/style.dart';
part 'home_driver_state.dart';

class HomeDriveLogic extends Cubit<HomeDriveState> {
  HomeDriveLogic() : super(AppIntialStates());

  static HomeDriveLogic get(context) =>
      BlocProvider.of<HomeDriveLogic>(context);
  List<IconData> iconList = [
    Icons.person_outline,
    Icons.payment,
    Icons.local_taxi_outlined,
    Icons.home_outlined,
  ];
  List<Widget> pages = [
    const ProfileDriver(),
    const PaymentUserPage(),
    const OrderUserPage(),
    const HomeDriverPage(),
  ];
  int x = 3;
  Widget changePages() {
    return pages.elementAt(x);
  }

  void changeclickebuton(index) {
    x = index;
    emit(ChangeClickButtonStates());
  }

  bool isBottomSheet = false;
  IconData floatingIcon = Icons.search_outlined;
  void changeButtonSheets({required bool isShow, required IconData icon}) {
    isBottomSheet = isShow;
    floatingIcon = icon;
    emit(ShowButtomsheetstates());
  }



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

  UpdateDriverResponse updateDriverResponse = UpdateDriverResponse();
  Future updateDriver({
    required String token,
    required String password,
    required String email,
    required String confirmPassword,
    required String addresses,
  }) async {
    emit(LoadingUpdateDriverApiAppState());
    await UpDateDriverRequest()
        .upDateDriverRequest(
            password: password,
            email: email,
            confirmPassword: confirmPassword,
            token: token,
            addresses: addresses)
        .then((value) {
      updateDriverResponse = value;
      emit(SuscessUpdateDriverApiAppState());
    }).catchError((error) {
      emit(ErorrUpdateDriverApiAppState());
    });
  }
  LocationDriverResponse locationDriverResponse=LocationDriverResponse();
  Future locationDriver({
    required String token,
    required String type,
    required double lat,
    required double lng,
  }) async {
    print("this lat,lng:$lat,$lng");
    emit(LoadingLocationDriverApiAppState());
    await LocationDriverRequest()
        .locationDriverRequest(token: token, type: type, lat: lat, lng: lng)
        .then((value) {
      print("sucess lat");
      locationDriverResponse = value;
      emit(SuscessLocationDriverApiAppState());
    }).catchError((error) {
      emit(ErorrLocationDriverApiAppState());
    });
  }
  ProfileDriverResponse profileDriverRespone=ProfileDriverResponse();
  Future getDriverProfile({
    required String token,
  }) async {
    emit(LoadingDriverProfile());
    await ProfileDriverRequest()
        .profileDriverRequest(token: token,)
        .then((value) {
      profileDriverRespone = value;
      emit(SucessDriverProfile());
    }).catchError((error) {
      emit(ErrorDriverProfile());
    });
  }
}
