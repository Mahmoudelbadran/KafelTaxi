import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../style/style.dart';
import '../../../../view/person_user_view/person_user_view.dart';

class PersonUserPage extends StatefulWidget {
  const PersonUserPage({Key? key}) : super(key: key);

  @override
  State<PersonUserPage> createState() => _PersonUserPageState();
}

class _PersonUserPageState extends State<PersonUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const PersonUserView(),
    );
  }
}
