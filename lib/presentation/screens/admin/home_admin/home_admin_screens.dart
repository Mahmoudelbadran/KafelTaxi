import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/presentation/style/style.dart';

import '../../../view/admin_view/payment_admin/payment_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey ,
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: ycolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "المسؤول",
          style: TextStyle(
              color: backgroundcolor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Container(
              width: 100.w,
              height: 20.h,
              decoration: const BoxDecoration(
                  color: ycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(150, 100),
                      bottomRight: Radius.elliptical(150, 100))),
            ),
            Positioned(
                top: 5.h,
                left: 10.w,
                right: 10.w,
                child: const PaymentAdmin()),
            Positioned(
                top: 26.h,
                left: 10.w,
                right: 10.w,
                child: Container(
                  width: 80.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: backgroundcolor),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, UserDataScreen);
                        },
                        leading: const Icon(Icons.arrow_back_ios),
                        title: const Text(
                          "المستخدمين",
                          textAlign: TextAlign.end,
                        ),
                        subtitle: const Text(
                          "سجلات،معلومات ",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Icon(
                          Icons.group_outlined,
                          size: 25.sp,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, DriveDataScreens);
                        },
                        leading: const Icon(Icons.arrow_back_ios),
                        title: const Text(
                          "السائقين",
                          textAlign: TextAlign.end,
                        ),
                        subtitle: const Text(
                          "سجلات،معلومات ",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Icon(
                          Icons.drive_eta,
                          size: 25.sp,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.arrow_back_ios),
                        title: const Text(
                          "ملاحظات",
                          textAlign: TextAlign.end,
                        ),
                        subtitle: const Text(
                          "السائقين،المستخدمين ",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Icon(
                          Icons.notifications_active_outlined,
                          size: 25.sp,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
