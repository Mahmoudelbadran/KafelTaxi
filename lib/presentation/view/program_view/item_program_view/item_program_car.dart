import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

import '../../../../data/Remote/response/user/nearest_response/nearest_response.dart';
import '../../../screens/home_screens/user/program_work/program_call/call_screen.dart';

class ItemProgramCar extends StatelessWidget {
  final NearestDriver dataDriver;
  const ItemProgramCar({Key? key, required this.dataDriver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.sp),
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(
          color: wcolor, borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ButtonFc(

                onpres: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: 100.w,
                        height: 40.h,
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
                height: 17.h,
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Expanded(
                  child: Text(
                    dataDriver.userName,
                    maxLines: 1,

                    style: TextStyle(

                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: textcolor),
                  ),
                ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    dataDriver.carType,
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: textcolor),
                  ),
                  Icon(Icons.car_crash_outlined,color: ycolor,size: 15.sp,),
                ],),
              ),
              Expanded(
                child: Padding(
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
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dataDriver.carId,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: textcolor),
                    ),
                    Text(
                      ": رقم السياره",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: textcolor),
                    ),
                  ],),
              ),
            ],
          ),
              )),
          Expanded(
              child: Center(child: Container(
                margin: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    border: Border.all(color: ycolor, width:2.sp)),
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset("images/drive.jpg",fit: BoxFit.fill,width:18.w,height: 10.h,
                  ),
                ),
              ),))
        ],
      ),
    );
  }
}
