import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';

class LoadingCallScreen extends StatefulWidget {
  const LoadingCallScreen({Key? key}) : super(key: key);

  @override
  State<LoadingCallScreen> createState() => _LoadingCallScreenState();
}

class _LoadingCallScreenState extends State<LoadingCallScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), () {
     Navigator.pushNamed(context, CallContentUser);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Text(
          "...جاري الاتصال بالسائق",
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
