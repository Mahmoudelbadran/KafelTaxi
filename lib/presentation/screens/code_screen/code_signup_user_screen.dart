import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart'as screens;
import '../../style/style.dart';
import '../../widget/button_fc.dart';

class CodeSigInUpUserScreen extends StatelessWidget {
  const CodeSigInUpUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController accNumber = TextEditingController();
    return  Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
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
      body: SizedBox(width: 100.w,height: 95.h,child:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 20.h,
                child: SvgPicture.asset("images/icons.svg")),
            Padding(padding: EdgeInsets.only(top: 4.h),child: Text("SMSكود",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.sp),),),
            Text("ادخل الرمز المكون من 4 ارقام والذي تم ارساله الي الرقم",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp,color: textcolor.withOpacity(0.5)),),
            Container(
              margin: EdgeInsets.all(10.sp),
              width: 90.w,
              height: 8.h,
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(color:wcolor)],
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              child: TextFormField(
                controller: accNumber,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp ),
                maxLength: 4,
                decoration:   const InputDecoration(
                  border: InputBorder.none,
                  hintTextDirection: TextDirection.rtl,


                ),

              ),

            ),
            Padding(
              padding:  EdgeInsets.only(top:2.h,bottom: 2.h),
              child: ButtonFc(onpres:(){
                Navigator.pushNamedAndRemoveUntil(context, screens.ConfirmationUserScreen, (route) => false);
              },
                Boxcolor: ycolor,
                elevation: 0,
                padding: EdgeInsets.only(left: 40.w,right: 40.w),
                child:Text("متابعة",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w500),),
              ),
            ),
            Text(" (2:00) اعادة الارسال بعد",style: TextStyle(fontSize: 10.sp,color: textcolor.withOpacity(0.5)),)



          ],),
      ),),
    );
  }
}
