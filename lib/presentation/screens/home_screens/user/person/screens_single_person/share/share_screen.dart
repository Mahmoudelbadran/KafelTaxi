import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "شاركنا مع اصدقائك",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: textcolor, fontSize: 11.sp),
          ),
          SizedBox(
              width: 100.w,
              height: 8.h,
              child: Row(
                children: [
                  Expanded(
                      child: ButtonFc(
                    onpres: () {},
                    Boxcolor: backgroundcolor,
                    elevation: 0,
                    child: Column(
                      children: [
                        Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                        Text(
                          "اخرون",
                          style: TextStyle(fontSize: 10.sp),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ButtonFc(
                    onpres: () {},
                    Boxcolor: backgroundcolor,
                    elevation: 0,
                    child: Column(
                      children: [
                        Icon(
                          Icons.sms,
                          color: Colors.green,
                          size: 30.sp,
                        ),
                        Text(
                          "SMS",
                          style: TextStyle(fontSize: 10.sp),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ButtonFc(
                    onpres: () {},
                    Boxcolor: backgroundcolor,
                    elevation: 0,
                    child: Column(
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 30.sp,
                        ),
                        Text(
                          "FaceBook",
                          style: TextStyle(fontSize: 10.sp),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ButtonFc(
                    onpres: () {},
                    Boxcolor: backgroundcolor,
                    elevation: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                          child: SvgPicture.asset("images/whatsapp.svg"),
                        ),
                        Text(
                          "Whatsapp",
                          style: TextStyle(fontSize: 10.sp),
                        )
                      ],
                    ),
                  )),
                ],
              ))
        ],
      ),
    );
  }
}
