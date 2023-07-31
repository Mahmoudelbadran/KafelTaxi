import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../style/style.dart';
import '../../widget/button_fc.dart';

class ItemUserCall extends StatelessWidget {
  const ItemUserCall({Key? key}) : super(key: key);
  void _makePhoneCall(String phoneNumber) async {
    final String phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        height: 20.h,
        decoration: BoxDecoration(
            color: wcolor, borderRadius: BorderRadius.circular(10.sp)),
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 3.h,
              color: Colors.greenAccent,
              child: Text(
                "متصل الان",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.sp, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 16.h,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h, left: 1.w),
                              child: ButtonFc(
                                onpres: () {},
                                width: 8.w,
                                elevation: 0,
                                height: 4.h,
                                Boxcolor: ycolor,
                                child: Text(
                                  "تاكيد وصول",
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h, left: 1.w),
                              child: ButtonFc(
                                onpres: () {
                                  _makePhoneCall('020103325552');
                                },
                                width: 10.w,
                                elevation: 0,
                                height: 5.h,
                                Boxcolor: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "اتصال",
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 12.sp,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h, left: 1.w),
                              child: ButtonFc(
                                onpres: () {},
                                width: 10.w,
                                elevation: 0,
                                height: 5.h,
                                Boxcolor: Rcolor,
                                child: Text(
                                  "الغاء الرحلة",
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 17.h,
                        margin: EdgeInsets.only(left: 5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "احمد علي",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      "القاهره",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textcolor),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      " من",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textcolor),
                                    ),
                                  ),
                                  Flexible(
                                    child: Icon(
                                      Icons.circle_outlined,
                                      color: ycolor,
                                      size: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "الاسكندريه",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textcolor),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "الي ",
                                      maxLines: 1,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textcolor),
                                    ),
                                  ),
                                  Flexible(
                                    child: Icon(
                                      Icons.check_circle_outline,
                                      color: ycolor,
                                      size: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "588985",
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
                      margin: EdgeInsets.all(3.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          border: Border.all(color: ycolor, width: 3.sp)),
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "images/usericons.png",
                          fit: BoxFit.fill,
                          width: 18.w,
                          height: 10.h,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ));
  }
}
