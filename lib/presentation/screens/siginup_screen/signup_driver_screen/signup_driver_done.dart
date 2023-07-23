import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../../../bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../../core/chang_page/controle_page.dart';
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
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController carType = TextEditingController();

  late LoginAndRegisterLogic cubit;
  @override
  void initState() {
    cubit = LoginAndRegisterLogic.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
      ),
      body: BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
        builder: (context, state) {
          return SafeArea(
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
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.sp),
                            prefixIcon: IconButton(
                              icon: Icon(
                                cubit.surFixIcons,
                                color: ycolor,
                              ),
                              onPressed: () => cubit.showPasswordDriver(),
                            ),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontSize: 13.sp),
                            hintText: '  كلمه المرور',
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
                          controller: passwordConfirm,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          obscureText: cubit.isHidden,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(
                                cubit.surFixIcons,
                                color: ycolor,
                              ),
                              onPressed: () => cubit.showPasswordDriver(),
                            ),
                            contentPadding: EdgeInsets.all(10.sp),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontSize: 13.sp),
                            hintText: '  تاكيد كلمه المرور',
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
                          controller: address,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.sp),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontSize: 13.sp),
                            hintText: ' العنوان بالتفاصيل',
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
                          controller: email,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.sp),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontSize: 13.sp),
                            hintText: ' البريد الالكتروني',
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
                          controller: carType,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.sp),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontSize: 13.sp),
                            hintText: 'نوع سيارتك',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                        child: ButtonFc(
                          onpres: () {
                            if (key.currentState!.validate()) {
                              cubit.signUpDriver(
                                  userName: cubit.nameDriver.toString(),
                                  email: email.text,
                                  phone: cubit.numberDriverPhone.toString(),
                                  password: password.text,
                                  confirmPassword: passwordConfirm.text,
                                  addresses: address.text,
                                  carType: carType.text,
                                  carId: cubit.carId.toString(),
                                  listId: cubit.numberId.toString(),
                                  id: cubit.id.toString());
                              if (state is LoadingSignUpDriverApiAppState) {
                                Fluttertoast.showToast(
                                    msg: "جاري تسجيل الدخول",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: ycolor,
                                    textColor: Colors.white,
                                    fontSize: 15.sp);
                              } else if (state
                                  is SuscessSignUpDriverApiAppState) {
                                Fluttertoast.showToast(
                                    msg: "نجحت في التسجيل الدخول",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 15.sp);
                                Navigator.pushNamedAndRemoveUntil(context,
                                    SignInDriverScreen, (route) => false);
                              } else if (state
                                  is ErorrSignUpDriverApiAppState) {
                                Fluttertoast.showToast(
                                    msg: "خطا البيانات",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.sp);
                              }
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

  @override
  void dispose() {
    carType.dispose();
    email.dispose();
    address.dispose();
    password.dispose();
    passwordConfirm.dispose();
    super.dispose();
  }
}
