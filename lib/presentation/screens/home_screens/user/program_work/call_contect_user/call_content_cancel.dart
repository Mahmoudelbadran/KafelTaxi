import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../bussinus_logic/user_logic/home_user_logic.dart';
import '../../../../../../core/chang_page/controle_page.dart';
import '../../../../../style/style.dart';
import '../../../../../widget/button_fc.dart';

class CallContentUserCancel extends StatelessWidget {
  const CallContentUserCancel({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final cubit = HomeUserLogic.get(context);
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
                      color: Colors.black.withOpacity(0.5), fontSize: 12.sp),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              "كتاب ركوب",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: textcolor),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 2.w, top: 1.h),
              width: 25.w,
              height: 12.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  border: Border.all(color: ycolor, width: 2.sp)),
              child: const CircleAvatar(
                  backgroundImage: AssetImage("images/drive.jpg"))),
          Container(
            padding: EdgeInsets.all(5.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "كيفن فراي",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: textcolor),
                ),
                Text(
                  "+0201033093103",
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: textcolor.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4.7",
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
          Padding(
            padding: EdgeInsets.all(2.sp),
            child: Divider(
              color: Colors.black.withOpacity(0.3),
              height: 2.sp,
            ),
          ),
          SizedBox(
              width: 50.w,
              height: 20.h,
              child: Image.asset(
                "images/vcar.png",
                fit: BoxFit.fill,
              )),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '!',
                  style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'تم الغاء',
                  style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'رحلتك',
                  style: TextStyle(
                      color: Rcolor.withOpacity(0.7),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 2.h),
            child: Text(
              'سوف يكون الرد اعتمادا علي الخاص بك وقت الالغاء',
              style: TextStyle(
                  color: textcolor.withOpacity(0.7),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
              width: 85.w,
              height: 9.h,
              child: Image.asset(
                "images/slidec.png",
                fit: BoxFit.fill,
              )),
          Text(
            '(2:30)ركوب وصوله في',
            style: TextStyle(
                color: textcolor.withOpacity(0.7),
                fontSize: 10.sp,
                fontWeight: FontWeight.w300),
          ),
          ButtonFc(
            onpres: () {
              Navigator.pushNamedAndRemoveUntil(context, HomeUserScreen, (route) => false);
            },
            width: 80.w,
            elevation: 0,
            height: 5.h,
            Boxcolor: ycolor,
            child: Text(
              "العوده الي الخريطة",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),

        ],
      ),
    );
  }
}
