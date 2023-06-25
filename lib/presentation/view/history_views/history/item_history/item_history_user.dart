import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';

class ItemHistoryUser extends StatelessWidget {
  final String order;
  const ItemHistoryUser({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 16.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(12.sp),
                height: 12.h,
                child: Text(
                  "12.8\$",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: textcolor),
                ),
              )),
              Expanded(
                  child: Container(

                height: 13.h,
                padding: EdgeInsets.only(
                    top: 10.sp, left: 30.sp, right: 10.sp, bottom: 5.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "مساء ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        ),
                        Text(
                          "6:05",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        ),
                        Text(
                          "يونيو ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        ),
                        Text(
                          "27",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text("القاهره - مصر",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: textcolor.withOpacity(0.7)))),
                        Expanded(
                            child: Icon(
                          Icons.circle_outlined,
                          color: ycolor,
                          size: 20.sp,
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text("الاسكندرية - مصر",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textcolor.withOpacity(0.7)))),
                        Expanded(
                            child: Icon(
                              Icons.check_circle_outline,
                              color: ycolor,
                              size: 20.sp,
                            ))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
          SizedBox(
              width: 80.w,
              height: 3.h,
              child:  Text(
                order,
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: ycolor,

              )))
        ],
      ),
    );
  }
}
