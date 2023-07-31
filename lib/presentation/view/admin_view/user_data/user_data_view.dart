import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/admin_logic/admin_logic.dart';
import 'package:taxizer/presentation/style/style.dart';
import '../../../../core/chang_page/controle_page.dart';
import '../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../data/Remote/response/admin/all_user_response/all_user_response.dart';
import '../../../../data/local/my_cache.dart';
import '../../../screens/admin/history/user/edit_user/edit_user.dart';

class UserDataView extends StatelessWidget {
  final ResultAllUser data;
  const UserDataView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? tokenAdmin = MyCache.getString(keys: MyCacheKeys.tokenAdmin);
    late AdminLogic cubit = AdminLogic.get(context)
      ..paymentAllById(
          driverId: data.deviceToken, token: tokenAdmin.toString());
    return ListTile(
        onTap: () {
          Navigator.pushNamed(context, UserHistory, arguments: data.history);
        },
        leading: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            if (cubit.paymentByResponse.message=="All payments") {
              showDialog(
                context: context,
                builder: (context) => EditUser(
                  data: data,
                  userPayment: cubit.paymentByResponse.result,
                ),
              );
            } else {
              showDialog(
                  context: context,
                  builder: (context) => const Center(child: CircularProgressIndicator(color: ycolor,),),);
            }
          },
        ),
        title: Text(
          data.userName.toString(),
          textAlign: TextAlign.end,
        ),
        subtitle: const Text(
          "اضغط لاظهار الرحلات",
          textAlign: TextAlign.end,
        ),
        trailing: CircleAvatar(
          backgroundColor: backgroundcolor,
          radius: 20.sp,
          backgroundImage: const AssetImage("images/usericons.png"),
        ));
  }
}
