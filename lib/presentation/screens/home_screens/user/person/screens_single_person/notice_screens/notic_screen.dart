import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../style/style.dart';

class NoticScreen extends StatelessWidget {
  const NoticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
        appBar: AppBar(
          backgroundColor: backgroundcolor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "اشعارتك",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_off_sharp,
                color: ycolor,
                size: 150.sp,
              ),
              Text(
                "لايوجد لديك اشعارات",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              )
            ],
          ),
        ));
  }
}
