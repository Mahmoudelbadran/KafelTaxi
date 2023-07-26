import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../style/style.dart';
import '../../../../view/item_history_driver/item_history_driver.dart';


class HistoryDriver extends StatefulWidget {
  const HistoryDriver({Key? key}) : super(key: key);

  @override
  State<HistoryDriver> createState() => _HistoryDriverState();
}

class _HistoryDriverState extends State<HistoryDriver> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2,initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "تاريخ الركوب",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: const Center(child:HistoryDriverItem() ,),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}