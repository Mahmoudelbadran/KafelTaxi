import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../view/item_user_call/user_call.dart';

class UserCall extends StatelessWidget {
  const UserCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 100.w,height:20.h
        ,child: ListView.separated(
          itemBuilder: (context, index) =>const ItemUserCall(),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 1),
    );
  }
}
