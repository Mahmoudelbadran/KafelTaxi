import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/data/Remote/response/admin/all_driver_response/all_driver_response.dart';
import '../../../../bussinus_logic/admin_logic/admin_logic.dart';
import '../../../../core/chang_page/controle_page.dart';
import '../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../data/local/my_cache.dart';
import '../../../screens/admin/history/driver/edit_driver/edit_driver.dart';
import '../../../style/style.dart';
class DriveDataView extends StatelessWidget {
final ResultAllDriver data;
  const DriveDataView({Key? key, required this.data,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? tokenAdmin = MyCache.getString(keys: MyCacheKeys.tokenAdmin);
    late AdminLogic cubit = AdminLogic.get(context)
      ..paymentAllById(driverId: data.driverId, token: tokenAdmin.toString());
    return  ListTile(
        onTap: () {
          Navigator.pushNamed(context, driverHistory);
        },
       leading: IconButton(icon: const Icon(Icons.edit),onPressed: (){
        showDialog(
            context: context,
             builder: (context) => EditDriverOne(
               data: data, paymentData: cubit.paymentByResponse.result,
             ));
        },),
        title:   Text(
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
          backgroundImage: const AssetImage("images/drive.jpg"),
        ));
  }
}
