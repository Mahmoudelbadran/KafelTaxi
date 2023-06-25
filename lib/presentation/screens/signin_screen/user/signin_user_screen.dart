import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart' as screens;
import 'package:taxizer/presentation/style/style.dart';

import '../../../../bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../widget/button_fc.dart';

class SignInUserScreen extends StatefulWidget {
  const SignInUserScreen({Key? key}) : super(key: key);

  @override
  State<SignInUserScreen> createState() => _SignInUserScreenState();
}

class _SignInUserScreenState extends State<SignInUserScreen> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController numberPhone = TextEditingController();
  TextEditingController password = TextEditingController();
  late final cubit = LoginAndRegisterLogic.get(context);
  @override
  void dispose() {
    numberPhone.dispose();
    password.dispose();
    super.dispose();
  }
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
      body: BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
  builder: (context, state) {
    return Container(
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
                    "تسجيل دخول الي حسابك",
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
                      style: TextStyle(
                          color: textcolor, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.right,
                    )),
                Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(color: wcolor)],
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: TextFormField(
                    controller: numberPhone,
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.sp),
                      border: InputBorder.none,
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'ادخل رقم هاتفك',
                      suffixIcon: const CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'AE',
                        favorite: ['+971', 'AE'],
                        showFlag: true, // عرض العلم فقط
                        showCountryOnly: true, // إخفاء النص المرتبط بالعلم

                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2.h),
                  width: 90.w,
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(color: wcolor)],
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    obscureText: cubit.isHidden,
                    obscuringCharacter: "*",
                    validator: (text){
                      if(text!.isEmpty){
                        return '!يرجي كتابه الباسورد';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.sp),
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'كلمه المرور',
                        prefixIcon: IconButton(
                          icon: Icon(
                            cubit.surFixIcons,
                            color: ycolor,
                          ),
                          onPressed: () => cubit.showPasswordDriver(),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: ButtonFc(
                    onpres: () {
                      if(key.currentState!.validate()) {
                            Navigator.pushNamed(
                                context, screens.CodeLoginUserScreen);
                          }
                        },
                    Boxcolor: ycolor,
                    elevation: 0,
                    padding: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: Text(
                      "متابعة",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
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
                      Text(
                        " او المتابعة ب  ",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black.withOpacity(0.4),
                        height: 2.sp,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.h),
                  child: ButtonFc(
                      onpres: () {},
                      Boxcolor: wcolor,
                      elevation: 0,
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("images/google.svg"),
                          Text(
                            "Google",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 5.w, right: 5.w, bottom: 1.h, top: 1.h),
                  child: ButtonFc(
                      onpres: () {},
                      Boxcolor: wcolor,
                      elevation: 0,
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("images/apple.svg"),
                          Text(
                            "Apple",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, screens.SignUpUserScreens);
                      },
                      child: Text(
                        'انشاء حساب',
                        style: TextStyle(
                            color: ycolor.withOpacity(0.7),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Text(
                      'ليس لديك حساب؟ ',
                      style: TextStyle(
                          color: textcolor.withOpacity(0.7),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  },
),
    );
  }
}
