import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';

import '../../../core/chang_page/controle_page.dart'as screens;

class SingleOnBoarding extends StatelessWidget {
  const SingleOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key:scaffoldKey ,
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: backgroundcolor,
      ),
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          height: 95.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: 100.w,
                  height: 30.h,
                  child: SvgPicture.asset("images/opic.svg")),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  "!مرحبا، تشرفت بمقابلتك",
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: textcolor.withOpacity(0.7),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: Text(
                  "هل انت ؟ ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: textcolor.withOpacity(0.3),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, screens.AdminLoginScreens);
                  },
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, bottom: 1.h, top: 1.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp)),
                      side: BorderSide(color: ycolor, width: 1.sp)),
                  child: Text(
                    "مسؤول",
                    style: TextStyle(
                      color: ycolor,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,screens.SignInDriverScreen);
                  },
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 32.w, right: 32.w, bottom: 1.h, top: 1.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp)),
                      side: BorderSide(color: ycolor, width: 1.sp)),
                  child: Text(
                    "سائق",
                    style: TextStyle(
                      color: ycolor,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,screens.SignInUserScreen);
                  },
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 32.w, right: 32.w, bottom: 1.h, top: 1.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.sp)),
                      side: BorderSide(color: ycolor, width: 1.sp)),
                  child: Text(
                    "راكب",
                    style: TextStyle(
                      color: ycolor,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
