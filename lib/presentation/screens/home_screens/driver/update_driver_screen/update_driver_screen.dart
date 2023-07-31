import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'package:taxizer/bussinus_logic/user_logic/person_user_logic/person_user_logic.dart';
import '../../../../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../../../../data/local/my_cache.dart';
import '../../../../../bussinus_logic/driver_logic/home_driver_logic.dart';
import '../../../../../bussinus_logic/update_driver_logic/update_driver_logic.dart';
import '../../../../style/style.dart';
import '../../../../widget/button_fc.dart';

class UpdateDriver extends StatefulWidget {
  const UpdateDriver({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateDriver> createState() => _UpdateDriverState();
}

class _UpdateDriverState extends State<UpdateDriver> {
  GlobalKey<FormState> key = GlobalKey();
  late UpdateDriverLogic upDateUser;
  late List dataUser;
  late String? tokenDriver;
  late HomeDriveLogic userData = HomeDriveLogic.get(context);
  late LoginAndRegisterLogic cubit;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  void initState() {
    dataUser = MyCache.getListString(keys: MyCacheKeys.profileData);
    tokenDriver = MyCache.getString(keys: MyCacheKeys.tokenDriver);
    cubit = LoginAndRegisterLogic.get(context);
    upDateUser = UpdateDriverLogic.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonUserLogic, PersonUserState>(
      builder: (context, state) {
        return BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
          builder: (context, state) {
            return Scaffold(
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
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SafeArea(
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  color: backgroundcolor,
                  child:
                      BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
                    builder: (context, state) {
                      return Form(
                        key: key,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: ClipOval(
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.sp),
                                        border: Border.all(
                                            color: ycolor, width: 2.sp)),
                                    child: Image.asset(
                                      "images/usericons.png",
                                      fit: BoxFit.fill,
                                      width: 20.w,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.sp),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                     userData.profileDriverRespone.result.userName,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: textcolor),
                                    ),
                                    Text(
                                    userData.profileDriverRespone.result.phone,
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
                                            boxShadow: const [
                                              BoxShadow(color: wcolor)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        child: TextFormField(
                                          controller: email,
                                          keyboardType: TextInputType.text,
                                          textDirection: TextDirection.rtl,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.sp),
                                            border: InputBorder.none,
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            hintStyle:
                                                TextStyle(fontSize: 13.sp),
                                            hintText: '  البريد الالكتروني',
                                            labelText: userData.profileDriverRespone.result.email,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2.h),
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(color: wcolor)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        child: TextFormField(
                                          controller: password,
                                          keyboardType: TextInputType.text,
                                          textDirection: TextDirection.rtl,
                                          obscureText: cubit.isHidden,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.sp),
                                            prefixIcon: IconButton(
                                                icon: Icon(
                                                  cubit.surFixIcons,
                                                  color: ycolor,
                                                ),
                                                onPressed: () =>
                                                    cubit.showPasswordDriver()),
                                            border: InputBorder.none,
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            hintStyle:
                                                TextStyle(fontSize: 13.sp),
                                            hintText: '  كلمه المرور',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2.h),
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(color: wcolor)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        child: TextFormField(
                                          controller: confirmPassword,
                                          keyboardType: TextInputType.text,
                                          textDirection: TextDirection.rtl,
                                          obscureText: cubit.isHidden,
                                          decoration: InputDecoration(
                                            prefixIcon: IconButton(
                                              icon: Icon(
                                                cubit.surFixIcons,
                                                color: ycolor,
                                              ),
                                              onPressed: () =>
                                                  cubit.showPasswordDriver(),
                                            ),
                                            contentPadding:
                                                EdgeInsets.all(10.sp),
                                            border: InputBorder.none,
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            hintStyle:
                                                TextStyle(fontSize: 13.sp),
                                            hintText: '  تاكيد كلمه المرور',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2.h),
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(color: wcolor)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        child: TextFormField(
                                          controller: address,
                                          keyboardType: TextInputType.text,
                                          textDirection: TextDirection.rtl,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(10.sp),
                                            border: InputBorder.none,
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            hintStyle:
                                                TextStyle(fontSize: 13.sp),
                                            hintText: '  العنوان بالتفصيل',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 2.h, bottom: 2.h),
                                        child: BlocBuilder<UpdateDriverLogic,
                                            UpdateDriverState>(
                                          builder: (context, state) {
                                            return ButtonFc(
                                              onpres: () {
                                                if (key.currentState!
                                                    .validate()) {
                                                 upDateUser.updateDriver(
                                                      token: tokenDriver.toString(),
                                                      password: password.text,
                                                      email: email.text,
                                                      confirmPassword:
                                                          confirmPassword.text,
                                                      addresses: address.text);
                                                  if (state
                                                      is LoadingUpDateApiAppState) {
                                                    Fluttertoast.showToast(
                                                        msg: "جاري التحديث",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor: ycolor,
                                                        textColor: Colors.white,
                                                        fontSize: 15.sp);
                                                  } else if (state
                                                      is LoadingUpDateDriverAppState) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "لقد تم التحديث بنجاح",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor: ycolor,
                                                        textColor: Colors.white,
                                                        fontSize: 15.sp);
                                                    Navigator.pop(context);
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: "خطا في البيانات",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 15.sp);
                                                  }
                                                }
                                              },
                                              Boxcolor: ycolor,
                                              elevation: 0,
                                              padding: EdgeInsets.only(
                                                  left: 40.w, right: 40.w),
                                              child: Text(
                                                "تحديث",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    address.dispose();
    super.dispose();
  }
}
