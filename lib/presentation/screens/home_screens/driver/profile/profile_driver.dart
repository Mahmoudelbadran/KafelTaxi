import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';

import '../../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../../data/local/my_cache.dart';
import '../../../../style/style.dart';
import '../../../../view/profile_driver_view/profile_driver_view.dart';

class ProfileDriver extends StatefulWidget {
  const ProfileDriver({Key? key}) : super(key: key);

  @override
  State<ProfileDriver> createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late LoginAndRegisterLogic cubit;
  late String? token;
  @override
  void initState() {
    token=MyCache.getString(keys: MyCacheKeys.token);
    cubit=LoginAndRegisterLogic.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
              backgroundColor: backgroundcolor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "ملفك الشخصي",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )),
          body:  ProfileDriverView(token: token.toString(),),
        );
      },
    );
  }
}
