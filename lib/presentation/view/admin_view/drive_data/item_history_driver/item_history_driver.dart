import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
class ItemDriverHistory extends StatelessWidget {
  final String order;
  final String from;
  final String to;
  const ItemDriverHistory({Key? key, required this.order, required this.from, required this.to}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 18.h,
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
                      "",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: textcolor),
                    ),
                  )),
              Expanded(
                  child: Container(

                    height: 15.h,
                    padding: EdgeInsets.only(
                        top: 10.sp, left: 30.sp, right: 10.sp, bottom: 5.sp),
                    child: Column(
                      children: [

                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(from,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textcolor.withOpacity(0.7)))),
                              Expanded(
                                  child: Icon(
                                    Icons.circle_outlined,
                                    color: ycolor,
                                    size: 18.sp,
                                  ))
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(to,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: textcolor.withOpacity(0.7)))),
                              Expanded(
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: ycolor,
                                    size: 18.sp,
                                  ))
                            ],
                          ),
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
