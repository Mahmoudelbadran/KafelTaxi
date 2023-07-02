import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../style/style.dart';
import '../../../../view/item_bulider_car/item_bluider_car.dart';
import '../../../../view/item_bulider_car/item_car/item_car_ins.dart';

class OrderUserPage extends StatefulWidget {
  const OrderUserPage({Key? key}) : super(key: key);

  @override
  State<OrderUserPage> createState() => _OrderUserPageState();
}

class _OrderUserPageState extends State<OrderUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key:_scaffoldKey ,
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
              fontSize: 8.sp),

            ),
            Text(
              "ميني باص",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),

      ),
      body: Container(width: 100.w,height: 100.h,
        color:backgroundcolor,child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

      Container(margin: EdgeInsets.all(10.sp),
        width: 80.w,height: 15.h,color: backgroundcolor,child: const ItemCarIns(),),
        SizedBox( width:90.w,child: Divider(color: Colors.black.withOpacity(0.2),thickness: 1.sp,)),
        const ItemBuilderCar()
      ],),),
    );
  }
}
