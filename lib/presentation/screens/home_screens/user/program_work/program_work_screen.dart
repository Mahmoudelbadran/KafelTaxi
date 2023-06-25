import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../bussinus_logic/user_logic/home_user_logic.dart';
import '../../../../style/style.dart';
import '../../../../view/program_view/item_builder_screens.dart';

class ProgramWorkScreen extends StatelessWidget {
  const ProgramWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = HomeUserLogic.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                      color: Colors.black.withOpacity(0.5), fontSize: 9.sp),
                ),
              ],
            ),
            Text(
              cubit.address,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        color: backgroundcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "برامج التشغيل المتوفرة",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: textcolor),

              ),
            ),
            SizedBox(width:90.w,height: 83.h,child: const ItemBuilderView(),)
          ],
        ),
      ),
    );
  }
}
