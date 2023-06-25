import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../style/style.dart';
import '../../../widget/button_fc.dart';

class SignUpDriverDone extends StatefulWidget {
  const SignUpDriverDone({Key? key}) : super(key: key);

  @override
  State<SignUpDriverDone> createState() => _SignUpDriverDoneState();
}

class _SignUpDriverDoneState extends State<SignUpDriverDone> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController password = TextEditingController();
  late final cubit = LoginAndRegisterLogic.get(context);
  @override
  void dispose() {
   password.dispose();
   passwordConfirm.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroundcolor,elevation: 0,),
      body: BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
  builder: (context, state) {
    return SafeArea(
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
                      controller: password,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.rtl,
                      obscureText: cubit.isHidden,
                      decoration:    InputDecoration(
                        contentPadding: EdgeInsets.all(10.sp),
                        prefixIcon: IconButton(icon: Icon(cubit.surFixIcons,color: ycolor,),onPressed: ()=>cubit.showPasswordDriver(),),


                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  كلمه المرور',

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
                      controller: passwordConfirm,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.rtl,
                      obscureText: cubit.isHidden,
                      decoration:InputDecoration(
                        prefixIcon:IconButton(icon: Icon(cubit.surFixIcons,color: ycolor,),onPressed: ()=>cubit.showPasswordDriver(),),
                        contentPadding: EdgeInsets.all(10.sp),

                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: '  تاكيد كلمه المرور',

                      ),

                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:2.h,bottom: 2.h),
                    child: ButtonFc(onpres:(){
                      if(key.currentState!.validate()){
                        if(password==passwordConfirm){
                          //go to home
                        }
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
      );
  },
),
    );
  }
}
