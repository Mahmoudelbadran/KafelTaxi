import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/user_logic/home_user_logic.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';

import '../../../../../style/style.dart';
import '../../../../../widget/button_fc.dart';

class CallContentUser extends StatelessWidget {
  const CallContentUser({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
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
            Center(child: Container(
              margin: EdgeInsets.all(2.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  border: Border.all(color: ycolor, width:2.sp)),
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset("images/drive.jpg",fit: BoxFit.fill,width:18.w,height: 11.h,
                ),
              ),
            ),),
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
                  "images/taxii.png",
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
                    text: 'تم حجز',
                    style: TextStyle(
                        color: textcolor.withOpacity(0.7),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  TextSpan(
                    text: 'رحلتك',
                    style: TextStyle(
                        color: ycolor.withOpacity(0.7),
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
                '! السائق سوف يصل في بضع دقائق',
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
                  "images/slide.png",
                  fit: BoxFit.fill,
                )),
            Text(
              '(2:30)ركوب وصوله في',
              style: TextStyle(
                  color: textcolor.withOpacity(0.7),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding:  EdgeInsets.all(5.sp),
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
                              child: Text(
                                "هل انت متاكد انك تريد الغاء رحلتلك؟",
                                textAlign: TextAlign.right,
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
                                  Navigator.pushNamedAndRemoveUntil(context, CallContentUserCancel, (route) => false);
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
                  height:5.h,
                  Boxcolor: Rcolor,
                  child: Text(
                    "الغاء الرحلة",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(5.sp),
                child: ButtonFc(
                  onpres: () {
                   Navigator.pushNamedAndRemoveUntil(context, HomeUserScreen, (route) => false);
                  },
                  width: 25.w,
                  elevation: 0,
                  height:5.h,
                  Boxcolor: ycolor,
                  child: Text(
                    "الذهاب للمتابعه",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],)

          ],
        ),
      ),
    );
  }
}
