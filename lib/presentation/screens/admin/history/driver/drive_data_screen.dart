import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../style/style.dart';
import '../../../../view/admin_view/drive_data/drive_data_view.dart';

class DriveDataScreens extends StatefulWidget {
  const DriveDataScreens({Key? key}) : super(key: key);

  @override
  State<DriveDataScreens> createState() => _DriveDataScreensState();
}

class _DriveDataScreensState extends State<DriveDataScreens> {
  TextEditingController nameUser = TextEditingController();
  TextEditingController numberUser = TextEditingController();
  TextEditingController todayPrice = TextEditingController();
  TextEditingController monthPrice = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: backgroundcolor,
        appBar: AppBar(
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
          backgroundColor: backgroundcolor,
          centerTitle: true,
          title: Text(
            "قائمه السائقين",
            style: TextStyle(
                fontSize: 20.sp, color: ycolor, fontWeight: FontWeight.w800),
          ),
          elevation: 0,
        ),
        floatingActionButton: AnimSearchBar(
          color: ycolor,
          width: 400,
          textController: nameUser,
          onSuffixTap: () {
            setState(() {
              nameUser.clear();
            });
          }, onSubmitted: (val) {  },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: ListView.separated(
            itemBuilder: (context, index) => DriveDataView(
                  numberUser: numberUser,
                  nameUser: nameUser,
                  monthPrice: monthPrice,
                  todayPrice: todayPrice,
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 15));
  }
}
