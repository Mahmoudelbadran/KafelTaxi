import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart'as screens;
import 'package:taxizer/presentation/model_data_onboarding/model_onboarding.dart';

import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/widget/button_fc.dart';


class OnboardingView extends StatelessWidget {
    final ModelData modelData;
    final PageController pageController;
    final int currentPage;
  const OnboardingView({Key? key, required this.modelData, required this.pageController, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("${modelData.image}"),
        Text(
          "${modelData.title}",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: textcolor.withOpacity(0.8),
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(
            width: 80.w,
            child: Text(
              "${modelData.body}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: textcolor.withOpacity(0.7)),
            )),
        Padding(
          padding:EdgeInsets.only(top:12.h ),
          child: ButtonFc(
            width: 50.w,
            height: 5.h,
            radius: 7.sp,
            Boxcolor: ycolor,
            onpres: (){
              if (currentPage < 2) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }else{
                Navigator.pushNamed(context, screens.SingleOnBoarding);
              }
            },child: const Text("التالي",style: TextStyle(color:Colors.white,fontSize: 20)),),
        )
      ],
    );
  }
}
