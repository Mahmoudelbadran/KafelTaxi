import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';
import 'package:taxizer/presentation/style/style.dart';

import '../../../../../bussinus_logic/admin_logic/admin_logic.dart';
import '../../../../view/admin_view/user_data/user_data_view.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  TextEditingController nameUser = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AdminLogic cubit;
  late String? tokenAdmin;
  String searchText = '';
  @override
  void initState() {
    tokenAdmin = MyCache.getString(keys: MyCacheKeys.tokenAdmin);
    cubit = AdminLogic.get(context)..getAllUser(token: tokenAdmin.toString());
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
              size: 15.sp,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeAdminScreen, (route) => false);
            },
          ),
          backgroundColor: backgroundcolor,
          centerTitle: true,
          title: Text(
            "قائمه المستخدمين",
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
          },
          onSubmitted: (val) {
            setState(() {
              searchText = val;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: BlocBuilder<AdminLogic, AdminState>(
          builder: (context, state) {
            if (state is LoadingGetAllState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ycolor,
                ),
              );
            } else if (state is SuscessGetAllState) {
              return ListView.separated(
                itemCount: cubit.allUserResponse.result
                    .where((element) => element.userName
                        .toLowerCase()
                        .contains(searchText.toLowerCase()))
                    .toList()
                    .length,
                itemBuilder: (context, index) {
                  final filteredUsers = cubit.allUserResponse.result
                      .where((element) => element.userName
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .toList();
                  return UserDataView(
                    data: filteredUsers[index],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ycolor,
                ),
              );
            }
          },
        ));
  }

  @override
  void dispose() {
    nameUser.dispose();
    super.dispose();
  }
}
