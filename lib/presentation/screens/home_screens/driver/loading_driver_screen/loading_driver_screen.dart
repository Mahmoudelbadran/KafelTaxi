import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';

import '../../../../style/style.dart';

class LoadingScreenDriver extends StatefulWidget {
  const LoadingScreenDriver({Key? key}) : super(key: key);

  @override
  State<LoadingScreenDriver> createState() => _LoadingScreenDriverState();
}


class _LoadingScreenDriverState extends State<LoadingScreenDriver> {
  late LoginAndRegisterLogic data=LoginAndRegisterLogic.get(context);
  @override
  void initState() {
    MyCache.putString(keys: MyCacheKeys.token, value: data.loginDriverResponse.token);
    print(data.loginDriverResponse.token);
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeDriveScreen, (route) => false);
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

