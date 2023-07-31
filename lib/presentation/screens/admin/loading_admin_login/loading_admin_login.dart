import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/admin_logic/admin_logic.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';

import '../../../style/style.dart';


class LoadingAdminLogin extends StatefulWidget {
  const LoadingAdminLogin({Key? key}) : super(key: key);

  @override
  State<LoadingAdminLogin> createState() => _LoadingAdminLoginState();
}


class _LoadingAdminLoginState extends State<LoadingAdminLogin> {
  late AdminLogic data=AdminLogic.get(context);
  @override
  void initState() {
    MyCache.putString(keys: MyCacheKeys.tokenAdmin, value: data.loginResponse.token);
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeAdminScreen, (route) => false);
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

