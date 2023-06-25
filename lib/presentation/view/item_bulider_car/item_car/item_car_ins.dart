import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../style/style.dart';
import '../../../widget/button_fc.dart';

class ItemCarIns extends StatelessWidget {
  const ItemCarIns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 17.h,
      decoration: BoxDecoration(
          color: wcolor, borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          Expanded(
              child: Center(
                child: ButtonFc(
                  onpres: () {},
                  Boxcolor: Rcolor,
                  width: 7.w,
                  height: 3.h,
                  child:  Text(
                    "الغاء",
                    style: TextStyle(color: Colors.white,fontSize: 10.sp),
                  ),
                ),
              )),
          Expanded(
              child: Container(
                height: 15.h,
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text("لموزين",textAlign: TextAlign.right,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 13.sp),)),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.only(top: 1.h),
                      child: Text("4",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                    )),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("كم/ساعة ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                          Text("210 ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                          const Icon(Icons.speed_outlined,color: ycolor,),

                        ],),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("كم/ساعة ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                        Text("60 ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                        const Icon(Icons.attach_money_outlined,color: ycolor,),

                      ],)
                  ],),)),
          Expanded(child: SizedBox(
              width:20.w,
              height:10.h,child: SvgPicture.asset("images/limousine.svg"))),

        ],
      ),
    );
  }
}
