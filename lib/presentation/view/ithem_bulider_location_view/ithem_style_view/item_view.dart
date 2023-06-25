import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../style/style.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "دبي -الامارات",
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w600, color: textcolor),
      ),
      subtitle: const Text("مصر الدولي", textDirection: TextDirection.rtl),
      trailing: const Icon(Icons.access_time),
      leading: const Text("(200كم)", textDirection: TextDirection.rtl),
    );
  }
}
