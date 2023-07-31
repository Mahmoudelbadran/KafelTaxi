import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

import '../../../../../../bussinus_logic/admin_logic/admin_logic.dart';
import '../../../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../../../../data/Remote/response/admin/all_driver_response/all_driver_response.dart';
import '../../../../../../data/Remote/response/admin/payment_by_response/payment_by_response.dart';
import '../../../../../../data/local/my_cache.dart';

class EditDriverOne extends StatelessWidget {
  final ResultAllDriver data;
  final ResultPaymentBy paymentData;
  const EditDriverOne({Key? key, required this.data, required this.paymentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late AdminLogic cubit = AdminLogic.get(context);
    late String? tokenAdmin = MyCache.getString(keys: MyCacheKeys.tokenAdmin);
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
                      data.userName.toString(),
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: textcolor),
                    ),
                    Text(
                      data.phone.toString(),
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                          color: textcolor.withOpacity(0.5)),
                    ),
                    Center(
                      child: BlocBuilder<AdminLogic, AdminState>(
                        builder: (context, state) {
                          if(state is LoadingPaymentByIdState){
                            return const Center(child: CircularProgressIndicator(color: ycolor,),);
                          }else if(state is SuscessPaymentByIdState){
                            return Container(
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
                                                      "${paymentData.month[0].month}\$",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: textcolor))
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
                                                      "${paymentData.week[0].week}\$",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: textcolor))
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
                                                  Text("${paymentData.day[0].day}\$",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: textcolor))
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
                                          Text("${paymentData.year[0].year}\$",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: textcolor))
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          }else{
                            return const Center(child: CircularProgressIndicator(color: ycolor,),);
                          }

                        },
                      ),
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
            style: TextStyle(color: Colors.white, fontSize: 10.sp),
          ),
        ),
        ButtonFc(
          width: 5.w,
          height: 5.h,
          Boxcolor: Rcolor,
          onpres: () {
            cubit.deleteDriver(
                driverId: data.driverId, token: tokenAdmin.toString());
            Navigator.pop(context);
          },
          child: Text(
            "حذف المستخدم",
            style: TextStyle(color: Colors.white, fontSize: 10.sp),
          ),
        ),
      ],
    );
  }
}
