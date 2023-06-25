import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../history/item_history/item_history_user.dart';


class RunningView extends StatelessWidget {
  const RunningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top:7.sp),
          width: 90.w,
          height: 77.h,
          child: ListView.separated(
            itemBuilder: (context, index) =>  const ItemHistoryUser(order: ' جاريه الان..',) ,
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
