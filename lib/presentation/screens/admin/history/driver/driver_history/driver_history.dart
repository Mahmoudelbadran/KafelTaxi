import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/admin_logic/admin_logic.dart';
import '../../../../../../data/Remote/response/admin/all_driver_response/all_driver_response.dart';
import '../../../../../style/style.dart';
import '../../../../../view/admin_view/drive_data/item_history_driver/item_history_driver.dart';
class DriverHistory extends StatelessWidget {

  const DriverHistory({Key? key}) : super(key: key);
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
      body: BlocBuilder<AdminLogic, AdminState>(
        builder: (context, state) {
          if(state is LoadingGetAllState){
            return const Center(child: CircularProgressIndicator(color: ycolor,),);
          }else if(state is SuscessGetAllState){
            return ListView.separated(
              itemBuilder: (context, index) =>
                  ItemDriverHistory(
                    order: 'لقد اتم العمليه بنجاح',
                    from:"data[index].from ",
                    to: "data[index].to",
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 10,
            );
          }else{
            return const Center(child: CircularProgressIndicator(color: ycolor,),);
          }

        },
      ),
    );
  }
}
