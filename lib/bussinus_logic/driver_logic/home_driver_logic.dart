import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxizer/presentation/screens/home_screens/driver/home/Home_driver_page.dart';

import 'dart:ui' as ui;
import '../../presentation/screens/home_screens/user/payment/payment_user_page.dart';
import '../../presentation/screens/home_screens/user/person/person_user_page.dart';
import '../../presentation/screens/home_screens/user/taxi/order_user_page.dart';
import '../../presentation/style/style.dart';
part 'home_driver_state.dart';

class HomeDriveLogic extends Cubit<HomeDriveState> {
  HomeDriveLogic() : super(AppIntialStates());

  static HomeDriveLogic get(context) => BlocProvider.of<HomeDriveLogic>(context);
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
    const HomeDriverPage(),
  ];
  int x=3;
  Widget changePages() {
    return pages.elementAt(x);
  }

  void changeclickebuton(index) {
    x = index;
    emit(ChangeClickButtonStates());
  }
  bool isBottomSheet=false;
  IconData floatingIcon=Icons.search_outlined;
  void changeButtonSheets({required bool isShow,required IconData icon}){
    isBottomSheet=isShow;
    floatingIcon=icon;
    emit(ShowButtomsheetstates());
  }
  final List<Map<String, dynamic>> users = const [
    {
      'position': LatLng(30.0444, 31.2357),
      'name': 'Mahmoud',
      'images': 'images/usericons.png'
    },
    {
      'position': LatLng(30.0004, 31.25855),
      'name': 'Mahmoud',
      'images': 'images/usericons.png'
    },
    {
      'position': LatLng(31.0404, 32.2355),
      'name': 'Mahmoud',
      'images': 'images/usericons.png'
    },

  ];
  final List<Marker> markers = [];

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

  Future<void> loadData(BuildContext context) async {
    for (int i = 0; i < users.length; i++) {
      final Uint8List markerIcon = await getBytesFromAsset(
        path: users[i]['images'],
        width: 50,
      );

      final Marker marker = Marker(
        markerId: MarkerId('user$i'),
        position: users[i]['position'],
        icon: BitmapDescriptor.fromBytes(markerIcon),
      );

      markers.add(marker);
      emit(LoadDataState());
    }
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



}