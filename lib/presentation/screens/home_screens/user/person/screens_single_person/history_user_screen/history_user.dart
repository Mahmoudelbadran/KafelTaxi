import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../style/style.dart';
import '../../../../../../view/history_views/history/history_view.dart';
import '../../../../../../view/history_views/runing_view/runing_view.dart';

class HistoryUser extends StatefulWidget {
  const HistoryUser({Key? key}) : super(key: key);

  @override
  State<HistoryUser> createState() => _HistoryUserState();
}

class _HistoryUserState extends State<HistoryUser> with TickerProviderStateMixin {
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
        bottom: TabBar(
          indicatorWeight: 3,
     indicatorColor: ycolor,
          dividerColor: wcolor,
          controller: _tabController,
          tabs:  const [
            Tab(
             child:Text("التاريخ",style: TextStyle(color: Colors.black),) ,
            ),
            Tab(
              child:Text("قيد التشغيل",style: TextStyle(color: Colors.black),) ,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          History(),
          RunningView()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}