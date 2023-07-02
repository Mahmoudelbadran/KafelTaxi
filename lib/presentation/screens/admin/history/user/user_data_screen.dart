import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';

import '../../../../view/admin_view/user_data/user_data_view.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
   TextEditingController nameUser =TextEditingController();
   TextEditingController numberUser=TextEditingController() ;
   TextEditingController todayPrice=TextEditingController() ;
   TextEditingController monthPrice =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("قائمه المستخدمين",style: TextStyle(fontSize: 20.sp,color: ycolor,fontWeight: FontWeight.w800),),
          elevation: 0,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) =>  UserDataView(nameUser: nameUser,numberUser: numberUser,monthPrice: monthPrice,todayPrice: todayPrice,),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 15)
    );
  }
  @override
  void dispose() {
   nameUser.dispose();
   numberUser.dispose();
   monthPrice.dispose();
   todayPrice.dispose();
    super.dispose();
  }
}

