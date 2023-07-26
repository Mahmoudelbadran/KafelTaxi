import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/payment_logic/payment_logic.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';
import '../../../../style/style.dart';

class PaymentUserPage extends StatefulWidget {
  const PaymentUserPage({Key? key}) : super(key: key);

  @override
  State<PaymentUserPage> createState() => _PaymentUserPageState();
}

class _PaymentUserPageState extends State<PaymentUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PaymentLogic cubit;
  late String? token;
  @override
  void initState() {
    token=MyCache.getString(keys: MyCacheKeys.token);
    cubit = PaymentLogic.get(context)..getPaymentUser(token: token.toString());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentLogic, PaymentState>(
      builder: (context, state) {

        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
              backgroundColor: backgroundcolor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "اموالك",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )),
          body: BlocBuilder<PaymentLogic, PaymentState>(
  builder: (context, state) {
    if(state is LoadingPaymentAppState){
      return const Center(child: CircularProgressIndicator(color: ycolor,),);
    }else if(state is SuscessPaymentAppState ){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 7.h),
                width: 90.w,
                height: 30.h,
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
                                      "${cubit.paymentResponse.result!.day}\$",
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
                                      "${cubit.paymentResponse.result!.day}\$",
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
                                      "${cubit.paymentResponse.result!.day}\$",
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
                              "${cubit.paymentResponse.result!.day}\$",
                              style: TextStyle(
                                  fontSize: 12.sp, color: textcolor))
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
      );
    }else{
      return const Center(child: CircularProgressIndicator(color: ycolor,),);
    }

  },
),
        );
      },
    );
  }
}
