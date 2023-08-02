import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/data/local/my_cache.dart';
import 'package:taxizer/presentation/style/style.dart';
import '../../../../../../bussinus_logic/user_logic/home_user_logic.dart';
import '../../../../../../core/chang_page/controle_page.dart';
import '../../../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../../../data/Remote/response/user/nearest_response/nearest_response.dart';
import '../../../../../widget/button_fc.dart';
import '../loading_screen/loading_screen.dart';

class CallScreen extends StatelessWidget {
  final NearestDriver dataDriver;
  const CallScreen({Key? key, required this.dataDriver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data=MyCache.getListString(keys: MyCacheKeys.dataLocation);
    late HomeUserLogic cubit = HomeUserLogic.get(context);
    String? token = MyCache.getString(keys: MyCacheKeys.token);
    return Container(
      color: backgroundcolor,
      width: 100.w,
      height: 100.h,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  "اتصال",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 13.sp),
                ),
              ))
            ],
          ),
          Divider(
            color: Colors.black.withOpacity(0.5),
            height: 2.sp,
          ),
          Container(
            margin: EdgeInsets.only(top: 5.sp),
            width: 100.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: wcolor, borderRadius: BorderRadius.circular(10.sp)),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 1.w),
                          width: 20.w,
                          height: 7.h,
                          child: Text(
                            "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: textcolor),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              dataDriver.userName,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: textcolor),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataDriver.carType,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: textcolor),
                                ),
                                Icon(
                                  Icons.car_crash_outlined,
                                  color: ycolor,
                                  size: 15.sp,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "10",
                                    maxLines: 1,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textcolor),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ycolor,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataDriver.carId,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: textcolor),
                                ),
                                Text(
                                  ": رقم",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: textcolor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: Center(
                  child: Container(
                    margin: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(color: ycolor, width: 2.sp)),
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "images/drive.jpg",
                        fit: BoxFit.fill,
                        width: 20.w,
                        height: 10.h,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: ButtonFc(
                    onpres: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "الغاء الركوب؟",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: textcolor),
                                  ),
                                  Icon(
                                    Icons.error,
                                    color: Rcolor,
                                    size: 25.sp,
                                  ),
                                ],
                              ),
                              content: SizedBox(
                                width: 80.w,
                                height: 5.h,
                                child: Text(
                                  "هل انت متاكد انك تريد الغاء رحلتلك؟",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: textcolor,
                                      fontSize: 12.sp),
                                ),
                              ),
                              actions: [
                                ButtonFc(
                                  onpres: () {
                                    Navigator.pop(context);
                                  },
                                  width: 25.w,
                                  elevation: 0,
                                  height: 4.h,
                                  Boxcolor: wcolor,
                                  child: Text(
                                    "الغاء",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                                ButtonFc(
                                  onpres: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeUserScreen, (route) => false);
                                  },
                                  width: 25.w,
                                  elevation: 0,
                                  height: 4.h,
                                  Boxcolor: ycolor,
                                  child: Text(
                                    "تاكيد",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    width: 25.w,
                    elevation: 0,
                    height: 4.h,
                    Boxcolor: Rcolor,
                    child: Text(
                      "الغاء",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                ButtonFc(
                  onpres: () async {
                    double? distance = double.tryParse(data[2].replaceAll(' km', ''));
                    if (distance != null) {
                      await cubit.getNotification(
                        token: token.toString(),
                        driverId: dataDriver.tId,
                        point1: data[3],
                        point2: data[4],
                        lat: double.parse(data[3]),
                        long: double.parse(data[4]),
                        address: data[0],
                        pointTo1: data[5],
                        pointTo2: data[6],
                        lat1: double.parse(data[5]),
                        long1: double.parse(data[6]),
                        address1:data[1],
                        distance: distance,
                      ).then((value) {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: Colors.transparent.withOpacity(0.1),
                                height: 30.h,
                                child: const LoadingCallScreen(),
                              );
                            }
                        );
                      });

                    }
                  },
                  width: 25.w,
                  elevation: 0,
                  height: 4.h,
                  Boxcolor: ycolor,
                  child: Text(
                    "اتصال",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
