import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

class EditUser extends StatelessWidget {
  final TextEditingController nameUser ;
  final TextEditingController numberUser ;
  final TextEditingController todayPrice ;
  final TextEditingController monthPrice ;
  const EditUser({Key? key, required this.nameUser, required this.numberUser, required this.todayPrice, required this.monthPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "تفاصيل المستخدم",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ycolor, fontWeight: FontWeight.w800, fontSize: 15.sp),
      ),
      content: SizedBox(
          width: 80.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: nameUser,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: ycolor,
                      ),
                      hintText: "احمد علي"),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: numberUser,

                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: ycolor,
                    ),
                    hintText: "020235554855",
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: todayPrice,

                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: ycolor,
                    ),
                    hintText: "الرصيد اليومي : 120",
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: monthPrice,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: ycolor,
                    ),
                    hintText: "الرصيد الشهري : 860",
                  ),
                ),
              ),
            ],
          )),
      actions: [
        ButtonFc(
          width: 5.w,
          height: 5.h,
          Boxcolor: Rcolor,
          onpres: () {
            Navigator.pop(context);
          },
          child: Text(
            "الغاء",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ),
        ButtonFc(
          width: 5.w,
          height: 5.h,
          Boxcolor: Rcolor,
          onpres: () {

          },
          child: Text(
            "حظر المستخدم",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ),
        ButtonFc(
          width: 5.w,
          height: 5.h,
          Boxcolor: Colors.green,
          onpres: () {},
          child: Text(
            "موافقه",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        )
      ],
    );
  }

}
