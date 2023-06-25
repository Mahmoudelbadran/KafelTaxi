import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart' as screens;
import 'package:taxizer/presentation/style/style.dart';

import '../../../widget/button_fc.dart';


class SignUpUserScreens extends StatefulWidget {
  const SignUpUserScreens({Key? key}) : super(key: key);

  @override
  State<SignUpUserScreens> createState() => _SignUpUserScreensState();
}

class _SignUpUserScreensState extends State<SignUpUserScreens> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController numberPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        width: 100.w,
        height: 95.h,
        color: backgroundcolor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: 80.w,
                    height: 17.h,
                    child: SvgPicture.asset("images/icons.svg")),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    "انشاء حسابك",
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
                          text: 'مرحبا بكم في ',
                          style: TextStyle(
                              color: textcolor.withOpacity(0.7),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: 'تاكسي كفل حارس',
                          style: TextStyle(
                              color: ycolor.withOpacity(0.7),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: '.ادخل التفاصيل الخاصة بك ادناه لمواصلة الطلب.',
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
                SizedBox(
                    width: 95.w,
                    child: const Text(
                      "ادخل رقم هاتفك",
                      style:
                      TextStyle(color: textcolor, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.right,
                    )),
                Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(color:wcolor)],
                      borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: TextFormField(
                    controller: numberPhone,
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.rtl,
                    decoration:   const InputDecoration(
                      border: InputBorder.none,
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'ادخل رقم هاتفك',
                      suffixIcon: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'AE',
                        favorite: ['+971','AE'],
                        showFlag: true, // عرض العلم فقط
                        showCountryOnly: true, // إخفاء النص المرتبط بالعلم

                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),

                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(top:2.h,bottom: 2.h),
                  child: ButtonFc(onpres:(){
                    if(key.currentState!.validate()) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            screens.CodeSigInUpUserScreen, (route) => false);
                      }
                    },
                    Boxcolor: ycolor,
                    elevation: 0,
                    padding: EdgeInsets.only(left: 40.w,right: 40.w),
                    child:Text("متابعة",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                            color: Colors.black.withOpacity(0.4),
                            height: 2.sp,
                          )),
                      Text(" او المتابعة ب  ",style: TextStyle(fontSize:12.sp,color:Colors.black.withOpacity(0.5) ),),
                      Expanded(
                          child: Divider(
                            color: Colors.black.withOpacity(0.4),
                            height: 2.sp,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 5.w,right: 5.w,bottom: 1.h),
                  child: ButtonFc(onpres:(){},
                      Boxcolor: wcolor,
                      elevation: 0,
                      padding: EdgeInsets.only(left: 30.w,right: 30.w),
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("images/google.svg"),
                          Text("Google",style: TextStyle(color: textcolor,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                        ],)
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 5.w,right: 5.w,bottom: 5.h,top: 1.h),
                  child: ButtonFc(onpres:(){},
                      Boxcolor: wcolor,
                      elevation: 0,
                      padding: EdgeInsets.only(left: 30.w,right: 30.w),
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("images/apple.svg"),
                          Text("Apple",style: TextStyle(color: textcolor,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                        ],)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, screens.SignInUserScreen);
                      },
                      child: Text('تسجيل الدخول',
                        style: TextStyle(
                            color: ycolor.withOpacity(0.7),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300),),
                    ),
                    Text('لديك حساب بالفعل؟ ',
                      style: TextStyle(
                          color: textcolor.withOpacity(0.7),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300),),
                  ],)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
