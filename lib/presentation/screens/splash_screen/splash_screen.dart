import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxizer/core/chang_page/controle_page.dart' as screens;
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';
import 'package:taxizer/presentation/style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MyCache.initcachce();
    Future.delayed(const Duration(seconds: 5), () {
      String? token = MyCache.getString(keys: MyCacheKeys.token);
      String? tokenDriver = MyCache.getString(keys: MyCacheKeys.tokenDriver);
      String? tokenAdmin = MyCache.getString(keys: MyCacheKeys.tokenAdmin);
      if (token != null && token.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, screens.HomeUserScreen, (route) => false);
      } else if(tokenDriver != null && tokenDriver.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, screens.HomeDriveScreen, (route) => false);
      }else if(tokenAdmin != null && tokenAdmin.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, screens.HomeAdminScreen, (route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(
            context, screens.OnboardingScreen, (route) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    const String assetName = 'images/icons.svg';
    return Scaffold(
      key: scaffoldKey,
      body: Container(
          color: backgroundcolor,
          child: Center(
            child: SvgPicture.asset(
              assetName,
            ),
          )),
    );
  }
}
