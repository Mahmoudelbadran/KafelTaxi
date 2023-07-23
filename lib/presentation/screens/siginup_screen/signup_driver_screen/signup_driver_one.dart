import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../../core/chang_page/controle_page.dart' as screens;
import '../../../style/style.dart';
import '../../../widget/button_fc.dart';

class SignUpDriverFirst extends StatefulWidget {
  const SignUpDriverFirst({Key? key}) : super(key: key);

  @override
  State<SignUpDriverFirst> createState() => _SignUpDriverFirstState();
}

class _SignUpDriverFirstState extends State<SignUpDriverFirst> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController nameDriver = TextEditingController();
  TextEditingController numberId = TextEditingController();
  TextEditingController carId = TextEditingController();
  TextEditingController id = TextEditingController();
  late LoginAndRegisterLogic cubit;
  @override
  void initState() {
   cubit=LoginAndRegisterLogic.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroundcolor,elevation: 0,),
      body: SafeArea(
        child: Container(
          color: backgroundcolor,
          width: 100.w,
          height: 100.h,
         child: Form(
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
                      "تسجيل الدخول كسائق",
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
                      controller: nameDriver,
                      validator: (text){
                        if(text!.isEmpty){
                          return "الرجاء املئ ذلك ";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  الاسم',

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
                      controller: id,
                      validator: (text){
                        if(text!.isEmpty){
                          return "الرجاء املئ ذلك ";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  رقم الهويه الوطنيه',

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
                      controller: carId,
                      validator: (text){
                        if(text!.isEmpty){
                          return "الرجاء املئ ذلك ";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  رقم سياره الاجرة',

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
                      controller: numberId,
                      validator: (text){
                        if(text!.isEmpty){
                          return "الرجاء املئ ذلك ";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      textDirection: TextDirection.rtl,
                      decoration:    InputDecoration(
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  رقم لوحه الترخيص',

                      ),

                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:2.h,bottom: 2.h),
                    child: ButtonFc(onpres:(){
                      cubit.nameDriver=nameDriver.text;
                      cubit.carId=carId.text;
                      cubit.id=id.text;
                      cubit.numberId=numberId.text;
                      Navigator.pushNamed(
                          context, screens.SignUpDriverDone);
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
  },
);
  }
  @override
  void dispose() {
    nameDriver.dispose();
    numberId.dispose();
    carId.dispose();
    id.dispose();
    super.dispose();
  }
}
