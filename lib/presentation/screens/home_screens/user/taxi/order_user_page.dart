import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../style/style.dart';
import '../../../../view/item_bulider_car/item_bluider_car.dart';

class OrderUserPage extends StatefulWidget {
  const OrderUserPage({Key? key}) : super(key: key);

  @override
  State<OrderUserPage> createState() => _OrderUserPageState();
}

class _OrderUserPageState extends State<OrderUserPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
          "اختر نوع سيارتك",
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 12.sp),

            ),
            Text(
              "ميني باص",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),

      ),
      body: SizedBox(width: 100.w,height: 100.h,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(width: 100.w,height: 20.h,color: backgroundcolor,),
        SizedBox( width:90.w,child: Divider(color: Colors.black.withOpacity(0.2),thickness: 1.sp,)),
        SizedBox( width:90.w,height: 60.h,child:  ItemBuilderCar())
      ],),),
    );
  }
}
