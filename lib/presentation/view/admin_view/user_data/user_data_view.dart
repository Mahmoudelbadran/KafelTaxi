import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import '../../../../core/chang_page/controle_page.dart';
import '../../../screens/admin/history/user/edit_user/edit_user.dart';

class UserDataView extends StatelessWidget {
  final TextEditingController nameUser;
  final TextEditingController numberUser;
  final TextEditingController todayPrice;
  final TextEditingController monthPrice;
  const UserDataView(
      {Key? key,
      required this.nameUser,
      required this.numberUser,
      required this.todayPrice,
      required this.monthPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.pushNamed(context, UserHistory);
        },
        leading: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => EditUser(
                      nameUser: nameUser,
                      numberUser: numberUser,
                      todayPrice: todayPrice,
                      monthPrice: monthPrice,
                    ));
          },
        ),
        title: const Text(
          "احمد علي",
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
