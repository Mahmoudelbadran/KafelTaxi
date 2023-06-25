import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../../../../style/style.dart';
import '../../../../../../widget/button_fc.dart';
class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  late final cubit = LoginAndRegisterLogic.get(context);
  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
          backgroundColor: backgroundcolor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "تحديث ملفك الشخصي",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),

          ), leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 30.sp,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),),
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: backgroundcolor,
          child: BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      width: 40.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          border: Border.all(color: ycolor, width: 3.sp)),
                      child: Image.asset("images/usericons.png"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "محمود بدران",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor),
                          ),
                          Text(
                            "+0201033093103",
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        "اعدادات الحساب",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: textcolor),
                      ),
                    ),
                    Form(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 2.h),
                              width: 90.w,
                              decoration: BoxDecoration(
                                  boxShadow: const [BoxShadow(color: wcolor)],
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.sp),
                                  border: InputBorder.none,
                                  hintTextDirection: TextDirection.rtl,
                                  hintStyle: TextStyle(fontSize: 13.sp),
                                  hintText: '  البريد الالكتروني',
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
                                      onPressed: () => cubit.showPasswordDriver()),
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
                                keyboardType: TextInputType.text,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.sp),
                                  border: InputBorder.none,
                                  hintTextDirection: TextDirection.rtl,
                                  hintStyle: TextStyle(fontSize: 13.sp),
                                  hintText: '  العنوان بالتفصيل',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                              child: ButtonFc(
                                onpres: () {
                                  // go to homescreen
                                },
                                Boxcolor: ycolor,
                                elevation: 0,
                                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                                child: Text(
                                  "تحديث",
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

