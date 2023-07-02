import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../style/style.dart';
class PaymentUserPage extends StatefulWidget {
  const PaymentUserPage({Key? key}) : super(key: key);

  @override
  State<PaymentUserPage> createState() => _PaymentUserPageState();
}

class _PaymentUserPageState extends State<PaymentUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key:_scaffoldKey ,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          "اموالك",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        )

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 7.h),
                width: 90.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: wcolor, borderRadius: BorderRadius.circular(20.sp)),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Padding(
                     padding:  EdgeInsets.all(12.sp),
                     child: Row(children: [
                       Expanded(child: Column(children: [
                         Text("شهر",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,color: textcolor),),
                         Text("88\$",style: TextStyle(fontSize: 12.sp,color: textcolor))
                       ],)),
                       Expanded(child: Column(children: [
                         Text("اسبوع",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,color: textcolor),),
                         Text("22\$",style: TextStyle(fontSize: 12.sp,color: textcolor))
                       ],)),
                       Expanded(child: Column(children: [
                         Text("يوم",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,color: textcolor),),
                         Text("1.5\$",style: TextStyle(fontSize: 12.sp,color: textcolor))
                       ],))
                     ],),
                   ),
                    Center(
                      child: Column(children: [
                        Text("مجموع لمدة سنة",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600,color: textcolor),),
                        Text("1200 \$",style: TextStyle(fontSize: 12.sp,color: textcolor))
                      ],),
                    )

                  ],)
            ),
          ),
        ],
      ),
    );
  }
}
