import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'item_history/item_history_user.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top:7.sp),
          width: 90.w,
          height: 80.h,
          child: ListView.separated(
              itemBuilder: (context, index) => const ItemHistoryUser(order: 'تمت العمليه',),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 10,
          ),
        ),
      ],
    );
  }
}
