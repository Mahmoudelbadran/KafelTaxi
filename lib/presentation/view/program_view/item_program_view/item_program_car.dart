import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

import '../../../screens/home_screens/user/program_work/program_call/call_screen.dart';

class ItemProgramCar extends StatelessWidget {
  const ItemProgramCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.sp),
      width: 100.w,
      height: 17.h,
      decoration: BoxDecoration(
          color: wcolor, borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 1.w),
                width:20.w,
                height: 7.h,
                child: Text(
                  "12.8\$",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: textcolor),
                ),
              ),
              ButtonFc(

                onpres: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: 100.w,
                        height: 30.h,
                        child: const CallScreen(),
                      );
                    },
                  );
                },
                width: 10.w,
                elevation: 0,
                height: 4.h,
                Boxcolor: ycolor,
                child:  Text(
                  "احجز الان",
                  style: TextStyle(
                    fontSize: 10.sp,
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                  "كيفن فراي",
                  maxLines: 1,
                  style: TextStyle(

                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: textcolor),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  "ميني باص",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: textcolor),
                ),
                Icon(Icons.car_crash_outlined,color: ycolor,size: 15.sp,),
              ],),
              Padding(
                padding:  EdgeInsets.only(left: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "10",
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: textcolor),
                  ),
                  Icon(Icons.star,color: ycolor,size: 20.sp,),
                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "14552",
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: textcolor),
                  ),
                  Text(
                    ": رقم",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: textcolor),
                  ),
                ],),
            ],
          ),
              )),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              margin: EdgeInsets.only(right:2.w),

                width: 20.w,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    border: Border.all(color: ycolor, width: 2.sp)),
                child: const CircleAvatar(backgroundImage: AssetImage("images/drive.jpg"))
              ),
            ],
          ))
        ],
      ),
    );
  }
}
