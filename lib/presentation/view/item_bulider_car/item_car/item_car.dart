import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/model_data_onboarding/model_car_data.dart';
import 'package:taxizer/presentation/style/style.dart';

import '../../../widget/button_fc.dart';

class ItemCar extends StatelessWidget {
 final ModelCarData model;
  const ItemCar({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 13.h,
      decoration: BoxDecoration(
          color: wcolor, borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          Expanded(
              child: Center(
            child: ButtonFc(
              onpres: () {},
              Boxcolor: ycolor,
              width: 5.w,
              height: 3.h,
              child: const Text(
                "اختر",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
          Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text("${model.nameCar}",textAlign: TextAlign.right,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15.sp),),
              Text("${model.number}",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text("كم/ساعة ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                  Text("${model.speed} ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
               const Icon(Icons.speed_outlined,color: ycolor,),

              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("كم/ساعة ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                  Text("${model.price} ",textAlign: TextAlign.right,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 10.sp),),
                  const Icon(Icons.attach_money_outlined,color: ycolor,),

                ],)
          ],),)),
          Expanded(child: SvgPicture.asset("${model.images}")),

        ],
      ),
    );
  }
}
