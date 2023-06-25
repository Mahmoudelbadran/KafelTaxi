import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/chang_page/controle_page.dart'as screens;
import '../../../style/style.dart';
import '../../../widget/button_fc.dart';

class SignInUserInformation extends StatefulWidget {
  const SignInUserInformation({Key? key}) : super(key: key);

  @override
  State<SignInUserInformation> createState() => _SignInUserInformationState();
}

class _SignInUserInformationState extends State<SignInUserInformation> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroundcolor,elevation: 0,),
      body: SafeArea(
        child: Container(
          color: backgroundcolor,
          width: 100.w,
          height: 100.h,
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 5.h),
                      height: 18.h,
                      child: SvgPicture.asset("images/icons.svg")),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      "تسجيل الدخول كراكب",
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    width: 88.w,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'مرحبا بك في تطبيق',
                            style: TextStyle(
                                color: textcolor.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: ' كفل حارس',
                            style: TextStyle(
                                color: ycolor.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: '.تمتع برحلتلك.',
                            style: TextStyle(
                                color: textcolor.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(top: 2.h),
                    width: 90.w,
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color:wcolor)],
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: TextFormField(
      controller: firstName,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        contentPadding: EdgeInsets.all(10.sp),
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  الاسم الاول',

                      ),

                    ),

                  ),
                  Container(
                    margin:EdgeInsets.only(top: 2.h),
                    width: 90.w,
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color:wcolor)],
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: TextFormField(
                      controller: lastName,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        contentPadding: EdgeInsets.all(10.sp),
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  الاسم الاخير',

                      ),

                    ),

                  ),
                  Container(
                    margin:EdgeInsets.only(top: 2.h),
                    width: 90.w,
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color:wcolor)],
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: TextFormField(
                      controller: number,
                      keyboardType: TextInputType.number,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        contentPadding: EdgeInsets.all(10.sp),
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  رقم الهاتف',

                      ),

                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:2.h,bottom: 2.h),
                    child: ButtonFc(onpres:(){
                      if(key.currentState!.validate()) {
                          Navigator.pushNamed(context, screens.SignInUserDone);
                        }
                      },
                      Boxcolor: ycolor,
                      elevation: 0,
                      padding: EdgeInsets.only(left: 40.w,right: 40.w),
                      child:Text("متابعة",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
