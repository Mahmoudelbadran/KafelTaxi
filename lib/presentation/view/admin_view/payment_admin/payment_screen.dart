import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../style/style.dart';

class PaymentAdmin extends StatelessWidget {
  const PaymentAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80.w,
        height: 25.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: backgroundcolor,
            boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 2.sp)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: Center(
                child: Text(
                  "احصائيات",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ycolor,
                      fontSize: 15.sp),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.sp),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                            "شهر",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor),
                          ),
                          Text("88\$",
                              style: TextStyle(
                                  fontSize: 11.sp, color: textcolor))
                        ],
                      )),
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                            "اسبوع",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor),
                          ),
                          Text("22\$",
                              style: TextStyle(
                                  fontSize: 11.sp, color: textcolor))
                        ],
                      )),
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                            "يوم",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor),
                          ),
                          Text("1.5\$",
                              style: TextStyle(
                                  fontSize: 11.sp, color: textcolor))
                        ],
                      ))
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "مجموع لمدة سنة",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: textcolor),
                  ),
                  Text("1200 \$",
                      style: TextStyle(
                          fontSize: 10.sp, color: textcolor))
                ],
              ),
            )
          ],
        ));
  }
}
