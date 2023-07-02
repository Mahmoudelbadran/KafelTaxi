import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../style/style.dart';
import '../../../../../view/history_views/history/item_history/item_history_user.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 15.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundcolor,
        centerTitle: true,
        title: Text(
          "تاريخ الرحلات",
          style: TextStyle(
              fontSize: 20.sp, color: ycolor, fontWeight: FontWeight.w800),
        ),
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => const ItemHistoryUser(order: 'تمت العمليه',),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
      ),

    );
  }
}
