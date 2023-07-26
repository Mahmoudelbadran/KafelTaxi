import 'dart:typed_data';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'package:taxizer/bussinus_logic/payment_logic/payment_logic.dart';
import 'package:taxizer/bussinus_logic/user_logic/home_user_logic.dart';
import 'package:taxizer/bussinus_logic/user_logic/system_logic.dart';
import 'package:taxizer/data/local/my_cache.dart';
import '../../../../../core/contant/constant.dart';
import '../../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../style/style.dart';
import '../../../../view/program_view/item_program_view/item_program_car.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({Key? key}) : super(key: key);

  @override
  State<HomeUserPage> createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> {
  late HomeUserLogic cubit;
  late SystemLogic system;
  late PaymentLogic payment;
  late LoginAndRegisterLogic userData;
  Uint8List? markerIcon;
  late String? token ;

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      String? title = message.notification!.title;
      String? body = message.notification!.body;
      AwesomeNotifications().createNotification(
          content: NotificationContent(id: 123, channelKey: "call_channel",
            title: title,
            body: body,
            category: NotificationCategory.Call,
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            backgroundColor: Colors.orange,

          ),
          actionButtons: [
            NotificationActionButton(key: "Accept", label: "Accept Call",color: Colors.green
              ,autoDismissible: true,
            ),
            NotificationActionButton(key: "Reject", label: "Reject Call",color: Colors.red
              ,autoDismissible: true,
            ),

          ]
      );
      AwesomeNotifications().actionStream.listen((event){
        if(event.buttonKeyInput=="Reject"){
          print("call Reject");
        }else if(event.buttonKeyInput=="Accept"){
          print("call Accept");
        }else{
          print("click of notification");
        }

      });
    });
    system = SystemLogic.get(context);
    cubit = HomeUserLogic.get(context);
    userData = LoginAndRegisterLogic.get(context);
    token =MyCache.getString(keys: MyCacheKeys.token);
    cubit.getNearest(token: token.toString());
    cubit.getCurrentLocation();
    loadMarkerIcon();
    payment=PaymentLogic.get(context)..getPaymentUser(token:token.toString());
    super.initState();
  }

  Future<void> loadMarkerIcon() async {
    final bytes = await cubit.getBytesFromAsset(
      path: cubit.imageDriver,
      width: 100,
    );
    setState(() {
      markerIcon = bytes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUserLogic, HomeUserState>(
      builder: (context, state) {
        return BlocBuilder<SystemLogic, SystemState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: backgroundcolor,
              appBar: AppBar(
                backgroundColor: backgroundcolor,
                elevation: 0,
                centerTitle: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Text(
                          "موقعك الحالي",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                    Text(
                      cubit.address,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                heroTag: "btn1",
                onPressed: () async {
                  await cubit
                      .requestLocationPermission(context)
                      .then((value) => cubit.getCurrentLocation())
                      .then((value) => cubit.getLocation());
                  cubit.locationUser(
                      token: userData.loginUserResponse.token,
                      type: "point2",
                      lat: cubit.lat,
                      lng: cubit.lng);
                },
                backgroundColor: ycolor,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation:
              FloatingActionButtonLocation.startFloat,
              extendBody: true,
              body: BlocBuilder<HomeUserLogic, HomeUserState>(
                builder: (context, state) {
                  if(state is LoadingLocationDriverApiAppState){
                  return const Center(child:CircularProgressIndicator(color:ycolor),);
                  }
                  else{
                   return Stack(
                     children: [
                       SizedBox(
                         width: 100.w,
                         height: 100.h,
                         child: GoogleMap(
                           polylines: cubit.polyline,
                           mapType: MapType.terrain,
                           initialCameraPosition: cubit.currentLocation != null
                               ? CameraPosition(
                             target: LatLng(cubit.currentLocation!.longitude,
                                 cubit.currentLocation!.latitude),
                             zoom: 14,
                           )
                               : initialCameraPosition,
                           onTap: (location) async {
                             cubit.getAddress();
                             cubit.pickerLocation = location;
                           },
                           markers: {
                             if (cubit.currentLocation != null)
                               Marker(
                                   markerId: const MarkerId('Current Location'),
                                   position: cubit.currentLocation!,
                                   icon: BitmapDescriptor.defaultMarkerWithHue(
                                     BitmapDescriptor.hueAzure,
                                   ),
                                   onTap: () {}),
                             if (cubit.pickerLocation != null)
                               Marker(
                                   markerId: const MarkerId('Picker Location'),
                                   position: cubit.pickerLocation!,
                                   icon: BitmapDescriptor.defaultMarkerWithHue(
                                     BitmapDescriptor.hueAzure,
                                   ),
                                   onTap: () {}),
                             if (cubit.goGetLocation != null)
                               Marker(
                                 markerId: const MarkerId('point_locationOne'),
                                 position: cubit.goGetLocation!,
                                 icon: BitmapDescriptor.defaultMarkerWithHue(
                                   BitmapDescriptor.hueOrange,
                                 ),
                               ),
                             if (cubit.goGetLocationPointOne != null)
                               Marker(
                                 markerId: const MarkerId('point_location'),
                                 position: cubit.goGetLocationPointOne!,
                                 icon: BitmapDescriptor.defaultMarkerWithHue(
                                   BitmapDescriptor.hueOrange,
                                 ),
                               ),
                             for (int i = 0;
                             i < cubit.nearestResponse.nearestDriver.length;
                             i++)

                               Marker(
                                 markerId: MarkerId('driver$i'),
                                 position: const LatLng(
                                     30.7936, 31.0023
                                 ),
                                 onTap: () {
                                   showModalBottomSheet(
                                       context: context,
                                       builder: (BuildContext context) {
                                         return SizedBox(
                                           width: 100.w,
                                           height: 25.h,
                                           child:  ItemProgramCar(dataDriver: cubit.nearestResponse.nearestDriver[i],),
                                         );
                                       });
                                 },
                                 icon: markerIcon != null ? BitmapDescriptor.fromBytes(markerIcon!) :BitmapDescriptor.defaultMarkerWithHue(
                                   BitmapDescriptor.hueOrange,
                                 ),
                               )
                           },
                           onMapCreated: (GoogleMapController controller) {
                             cubit.mapController = controller;
                           },
                         ),
                       ),
                     ],
                   );
                 }


                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    cubit.mapController?.dispose();
    super.dispose();
  }
}
