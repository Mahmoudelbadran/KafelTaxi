import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../style/style.dart';
import '../../../../../../../widget/button_fc.dart';

class RateDone extends StatelessWidget {
  const RateDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          backgroundColor: backgroundcolor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "كيف كانت رحلتك",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sms_failed,
                color: ycolor,
                size: 150.sp,
              ),
              Text(
                ".لقد تم تقديم رايك بنجاح",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "شكرا لك علي مساعدتنا في التحسين",
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.5)),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: ButtonFc(
                  onpres: () {
                    Navigator.pop(context);
                  },
                  width: 90.w,
                  height: 5.h,
                  Boxcolor: ycolor,
                  child: Text(
                    "العوده",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15.sp),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
