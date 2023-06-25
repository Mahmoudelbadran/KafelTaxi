import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart'as screens;
import 'package:taxizer/presentation/style/style.dart';

import '../../../widget/button_fc.dart';

class ConfirmationDriverScreen extends StatelessWidget {
  const ConfirmationDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundcolor,
      ),
      body: SizedBox(
        width: 100.w,
        height: 95.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("images/confirmation.svg"),
            Text(
              "!تم التحقق بنجاح ",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: textcolor),
            ),
            Text(
              "!تم التحقق من رقمك ",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: textcolor.withOpacity(0.5)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
              child: ButtonFc(
                onpres: () {
                  Navigator.pushNamedAndRemoveUntil(context, screens.SignUpDriverFirst, (route) => false);
                },
                Boxcolor: ycolor,
                elevation: 0,
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: Text(
                  "متابعة",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
