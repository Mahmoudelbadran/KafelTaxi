import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart';
import 'package:taxizer/core/my_cache_keys/my_cache_keys.dart';
import 'package:taxizer/data/local/my_cache.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';

import '../../../../../../../bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../../../../../bussinus_logic/user_logic/comment_logic/comment_logic.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late LoginAndRegisterLogic userData = LoginAndRegisterLogic.get(context);
    late CommentLogic comment = CommentLogic.get(context);
    late String? token=MyCache.getString(keys: MyCacheKeys.token);
    late List? data=MyCache.getListString(keys: MyCacheKeys.profileData);
    TextEditingController commentUser = TextEditingController();
    return BlocBuilder<CommentLogic, CommentState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "كيف كانت رحلتك",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.sp),
                            border: Border.all(color: ycolor, width: 2.sp)),
                        child: Image.asset(
                          "images/usericons.png", fit: BoxFit.fill, width: 20.w,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                      (userData.loginUserResponse.data?.userName ?? data[0]),
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor),
                          ),
                          Text(
                            (userData.loginUserResponse.data?.phone ?? data[1]),
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                                color: textcolor.withOpacity(0.5)),
                          ),
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.h),
                    width: 90.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color: wcolor)],
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: TextFormField(
                      controller: commentUser,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.sp),
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        hintText: 'اكتب مراجعه(اختياري)',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: ButtonFc(
                      onpres: () {
                        comment.sendComment(
                            token: token.toString(),
                            comment: commentUser.text);
                        if (state is SuscessSentCommentAppState) {
                          Navigator.pushNamed(context, RateDone);
                        } else {
                          Fluttertoast.showToast(
                              msg: "يرجي المحاوله في وقت لاحق",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 15.sp);
                        }
                      },
                      width: 90.w,
                      height: 5.h,
                      Boxcolor: ycolor,
                      child: Text(
                        "ارسال",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15.sp),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
