import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/admin_logic/admin_logic.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';

import '../../../../../core/chang_page/controle_page.dart';
import '../../../../style/style.dart';
import '../../../../view/admin_view/drive_data/drive_data_view.dart';

class DriveDataScreens extends StatefulWidget {
  const DriveDataScreens({Key? key}) : super(key: key);

  @override
  State<DriveDataScreens> createState() => _DriveDataScreensState();
}

class _DriveDataScreensState extends State<DriveDataScreens> {
  TextEditingController nameUser = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AdminLogic cubit;
  late String? tokenAdmin;
  String searchText = '';
  @override
  void initState() {
    tokenAdmin = MyCache.getString(keys: MyCacheKeys.tokenAdmin);
    cubit = AdminLogic.get(context)
      ..getAllDriver(token: tokenAdmin.toString());
    super.initState();
  }

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
              Navigator.pushNamedAndRemoveUntil(context, HomeAdminScreen, (route) => false);
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
          onSubmitted: (val) {
    setState(() {
    searchText = val;
    });
          },
          onSuffixTap: () {
            setState(() {
              searchText = '';
              nameUser.clear();
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: BlocBuilder<AdminLogic, AdminState>(
          builder: (context, state) {
            if(state is LoadingGetAllDriverState){
              return const Center(child: CircularProgressIndicator(color:ycolor),);
            }else if(state is SuscessGetAllDriverState){
              return ListView.separated(
                  itemCount: cubit.allDriverResponse.result
                      .where((element) =>
                  element.userName.toLowerCase().contains(searchText.toLowerCase()))
                .toList()
                .length,
            itemBuilder: (context, index) {
            final filteredDrivers = cubit.allDriverResponse.result
                .where((element) =>
            element.userName
                .toLowerCase()
                .contains(searchText.toLowerCase()))
                .toList();
            return DriveDataView(
            data: filteredDrivers[index],
            );
            },
            separatorBuilder: (context, index) => const Divider()
              );
            }else{
              return const Center(child: CircularProgressIndicator(color:ycolor),);
            }
          },
        ));
  }
}
