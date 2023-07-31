import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/admin_logic/admin_logic.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

import '../../../../../../data/Remote/response/admin/all_user_response/all_user_response.dart';
import '../../../../../../data/Remote/response/admin/payment_by_response/payment_by_response.dart';

class EditUser extends StatelessWidget {
final ResultAllUser data;
final ResultPaymentBy userPayment;
  const EditUser({Key? key, required this.data, required this.userPayment}) : super(key: key);

  @override
  Widget build(BuildContext context){
late AdminLogic cubit=AdminLogic.get(context);
late String? tokenAdmin=MyCache.getString(keys: MyCacheKeys.tokenAdmin);
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
              SizedBox(
                width: 100.w,
                height: 15.h,
                child: Center(
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          border: Border.all(color: ycolor, width: 2.sp)),
                      child: Image.asset(
                        "images/usericons.png",
                        fit: BoxFit.fill,
                        width: 20.w,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.userName,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: textcolor),
                    ),
                    Text(
                     data.phone,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                          color: textcolor.withOpacity(0.5)),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 7.h),
                          width: 90.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: wcolor,
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "شهر",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: textcolor),
                                            ),
                                            Text(
                                                "${userPayment.month[0].month.toString()}\$",
                                                style: TextStyle(
                                                    fontSize: 12.sp, color: textcolor))
                                          ],
                                        )),
                                    Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "اسبوع",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: textcolor),
                                            ),
                                            Text(
                                                "${userPayment.week[0].week.toString()}\$",
                                                style: TextStyle(
                                                    fontSize: 12.sp, color: textcolor))
                                          ],
                                        )),
                                    Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "يوم",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: textcolor),
                                            ),
                                            Text(
                                                "${userPayment.day[0].day.toString()}\$",
                                                style: TextStyle(
                                                    fontSize: 12.sp, color: textcolor))
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "مجموع السنه",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: textcolor),
                                    ),
                                    Text(
                                        "${userPayment.year[0].year.toString()}\$",
                                        style: TextStyle(
                                            fontSize: 12.sp, color: textcolor))
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
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
cubit.deleteUserLogic(driverId: data.id, token: tokenAdmin.toString());
          },
          child: Text(
            "حذف المستخدم",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }

}
