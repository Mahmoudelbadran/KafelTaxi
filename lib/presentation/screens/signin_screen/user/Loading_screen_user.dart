import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';

import '../../../style/style.dart';

class LoadingScreenUser extends StatefulWidget {
  const LoadingScreenUser({Key? key}) : super(key: key);

  @override
  State<LoadingScreenUser> createState() => _LoadingScreenUserState();
}

class _LoadingScreenUserState extends State<LoadingScreenUser> {
  late LoginAndRegisterLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = LoginAndRegisterLogic.get(context);
    _initCache();
    _startTimer();
  }

  void _initCache() {
    final token = _logic.loginUserResponse?.token;
    final userData = _logic.loginUserResponse?.data;
    if (token != null && userData != null) {
      MyCache.putString(keys: MyCacheKeys.token, value: token);
      MyCache.putListString(keys: MyCacheKeys.profileData, value: [
        userData.userName,
        userData.phone,
        userData.email,
      ]);
      if (kDebugMode) {
        print(token);
      }
    }
  }

  void _startTimer() {
    Timer(const Duration(milliseconds: 5000), () {
      final token = MyCache.getString(keys: MyCacheKeys.token);
      if (token =='') {
        Navigator.pushReplacementNamed(context, SignInUserScreen);
      } else {
        Navigator.pushReplacementNamed(context, HomeUserScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: backgroundcolor,
      child: const Center(
        child: CircularProgressIndicator(
          color: ycolor,
        ),
      ),
    );
  }
}