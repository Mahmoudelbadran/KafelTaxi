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
    final String? token = MyCache.getString(keys: MyCacheKeys.token);
    Timer(const Duration(milliseconds: 5000), () {
      if (token == '') {
        Navigator.pushNamedAndRemoveUntil(
            context, screens.OnboardingScreen, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, screens.HomeUserScreen, (route) => false);
      }
    });
    super.initState();
  }

  @override
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
