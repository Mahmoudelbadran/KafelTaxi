import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

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
            size: 30.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(1.sp),
                width: 25.w,
                height: 13.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    border: Border.all(color: ycolor, width: 3.sp)),
                child: Image.asset("images/usericons.png"),
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "محمود بدران",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: textcolor),
                    ),
                    Text(
                      "0201033093103",
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                          color: textcolor.withOpacity(0.5)),
                    ),
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 90.w,
                height: 20.h,
                decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(color: wcolor)],
                    borderRadius: BorderRadius.circular(10.sp)),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.sp),
                    border: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(fontSize: 13.sp),
                    hintText: 'اكتب مراجعه(اختياري)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: ButtonFc(
                  onpres: () {
                    Navigator.pushNamed(context,RateDone );
                  },
                  width: 90.w,
                  height: 5.h,
                  Boxcolor: ycolor,
                  child: Text(
                    "ارسال",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15.sp),
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
