import 'dart:async';

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
  late LoginAndRegisterLogic data=LoginAndRegisterLogic.get(context);
  @override
  void initState() {
    MyCache.putString(keys: MyCacheKeys.token, value: data.loginUserResponse.token);
  MyCache.putListString(keys: MyCacheKeys.profileData, value: [
    data.loginUserResponse.data!.userName,
    data.loginUserResponse.data!.phone,
    data.loginUserResponse.data!.email,
  ]);
    print(data.loginUserResponse.token);
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeUserScreen, (route) => false);
    });
    super.initState();
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

