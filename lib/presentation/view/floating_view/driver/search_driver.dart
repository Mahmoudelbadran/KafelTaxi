import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/user_logic/home_user_logic.dart';

import '../../../style/style.dart';
import '../../../widget/button_fc.dart';
class SearchDriver extends StatelessWidget {
 final GlobalKey<FormState> formKey;
final TextEditingController myMap;
final TextEditingController location;
final user;
final system;
final drive;

  const SearchDriver({Key? key, required this.formKey, required this.myMap, required this.location, this.user, this.system, this.drive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUserLogic, HomeUserState>(
  builder: (context, state) {
    return Wrap(
      children: [
        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 100.w,
                height: 25.h,
                color: backgroundcolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:2,
                      child: Container(
                        margin: EdgeInsets.only(top:2.h,),
                        width: 90.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: wcolor)],
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: TextFormField(
                          controller: myMap,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.sp),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'موقعي الحالي',
                            suffixIcon: IconButton(
                              onPressed: () async {
                                await user
                                    .requestLocationPermission(context)
                                    .then((value) => user.getCurrentLocation())
                                    .then((value) {
                                  myMap.text = user.address;
                                  return user.getLocation();
                                });
                               final directions = await system.fetchDirection(
                                    origin: myMap.text,
                                    destination: location.text);
                                user.gotoLocationUserOne(
                                    place: directions['start_location']);
                                user.gotoLocationUserTwo(
                                    place: directions['end_location']);
                                drive.setPolyline(directions['polyline_decode']);
                              },
                              icon: const Icon(
                                Icons.my_location,
                                color: ycolor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(5.sp),
                        width: 90.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: wcolor)],
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: TextFormField(
                            controller: location,
                            keyboardType: TextInputType.text,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(6.sp),
                              border: InputBorder.none,
                              hintTextDirection: TextDirection.rtl,
                              hintText: 'الي اين نحن ذاهبون؟',
                              suffixIcon: const Icon(
                                Icons.location_on_outlined,
                                color: ycolor,
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("12", maxLines: 1, style: TextStyle(fontSize: 8.sp, color: Colors.black, fontWeight: FontWeight.w600)),
                          Text(" :وقت الوصول",maxLines: 1,style: TextStyle(fontSize: 8.sp,color: Colors.black,fontWeight: FontWeight.w600)
                          ),
                          Text("15", maxLines: 1, style: TextStyle(fontSize: 8.sp, color: Colors.black, fontWeight: FontWeight.w600)),
                          Text(" :المسافة",maxLines: 1,style: TextStyle(fontSize: 8.sp,color: Colors.black,fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 100.w,
                        height: 5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonFc(
                              onpres: () async {
                               final directions = await system.fetchDirection(
                                    origin: myMap.text,
                                    destination: location.text);
                                user.gotoLocationUserOne(
                                    place: directions['start_location']);
                                user.gotoLocationUserTwo(
                                    place: directions['end_location']);
                                drive.setPolyline(directions['polyline_decode']);
                              },
                              Boxcolor: ycolor,
                              width: 15.w,
                              height: 4.h,
                              child: const Text(
                                "البحث",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 90.w,
                        child: Divider(
                          color: Colors.black45.withOpacity(0.5),
                          thickness: 1.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  },
);
  }
}
