import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/admin_logic/admin_logic.dart';

import '../../../bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../core/chang_page/controle_page.dart';
import '../../style/style.dart';
import '../../widget/button_fc.dart';

class AdminLoginScreens extends StatefulWidget {
  const AdminLoginScreens({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreens> createState() => _AdminLoginScreensState();
}

class _AdminLoginScreensState extends State<AdminLoginScreens> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late LoginAndRegisterLogic cubit;
  late AdminLogic userAdmin;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    cubit = LoginAndRegisterLogic.get(context);
    userAdmin = AdminLogic.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLogic, AdminState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
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
                              "تسجيل الدخول كمسوؤل",
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
                              controller: username,
                              keyboardType: TextInputType.text,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.sp),
                                border: InputBorder.none,
                                hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(fontSize: 13.sp),
                                hintText: '  الاسم',
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
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return '!يرجي كتابه الباسورد';
                                }
                                return null;
                              },
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
                                hintText: '   كلمه المرور',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                            child: BlocBuilder<AdminLogic, AdminState>(
                              builder: (context, state) {
                                return ButtonFc(
                                  onpres: () {
                                    if (key.currentState!.validate()) {
                                      userAdmin.login(
                                          username: username.text,
                                          password: password.text);
                                      if (state is SuscessApiAppState) {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            HomeAdminScreen,
                                            (route) => false);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "خطا في البيانات",
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
                                  padding:
                                      EdgeInsets.only(left: 40.w, right: 40.w),
                                  child: Text(
                                    "متابعة",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                              },
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
      },
    );
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
