import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/driver_logic/home_driver_logic.dart';

import '../../../../style/style.dart';
import '../../../../widget/button_fc.dart';

class AlertCall extends StatelessWidget {
  const AlertCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDriveLogic, HomeDriveState>(
  builder: (context, state) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      title: Column(
        children: [
          Center(
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
                  width: 20.w,
                  height: 10.h,
                ),
              ),
            ),
          ),
          Text(
            "محمود بدران",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: textcolor, fontSize: 12.sp),
          ),
          Text(
            "0201033093103",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: textcolor.withOpacity(0.7), fontSize: 10.sp),
          ),
        ],
      ),
      content: SizedBox(
        width: 80.w,
        child: Wrap(children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'يريد ',
                  style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'محمود بدران ',
                  style: TextStyle(
                      color: ycolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: ' .اجراء اتصال معك',
                  style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '  من ',
                  style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'القاهره',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: textcolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: ' الي ',
                  style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'الاسكندريه',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: textcolor.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

        ],)
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
         Navigator.pop(context);
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
    );
  },
);
  }
}
