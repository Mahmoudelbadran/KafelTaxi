import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 12.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "شارك التطبيق مع أصدقائك",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ButtonFc(
                  onpres: () {
                    const url = "رابط التطبيق";
                    _launchURL(url);
                  },
                  height: 10.h,
                  Boxcolor: backgroundcolor,
                  elevation: 0,
                  child: Column(
                    children: [
                      Icon(
                        Icons.link_outlined,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "نسخ الرابط",
                        style: TextStyle(fontSize: 8.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ButtonFc(
                  onpres: () {
                    const url = "رابط التطبيق";
                    _launchURL(url);
                  },
                  Boxcolor: backgroundcolor,
                  elevation: 0,
                  child: Column(
                    children: [
                      Icon(
                        Icons.sms,
                        color: Colors.green,
                        size: 25.sp,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "رسالة نصية",
                        style: TextStyle(fontSize: 8.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ButtonFc(
                  onpres: () {
                    const url = "https://www.facebook.com/";
                    _launchURL(url);
                  },
                  Boxcolor: backgroundcolor,
                  elevation: 0,
                  child: Column(
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 25.sp,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "فيسبوك",
                        style: TextStyle(fontSize: 8.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ButtonFc(
                  onpres: () {
                    const url = "رابط التطبيق";
                    _launchURL(url);
                  },
                  Boxcolor: backgroundcolor,
                  elevation: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                        child: SvgPicture.asset("images/whatsapp.svg"),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "واتساب",
                        style: TextStyle(fontSize: 8.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}