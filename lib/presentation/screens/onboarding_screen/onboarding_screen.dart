import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxizer/presentation/style/style.dart';
import 'package:taxizer/presentation/view/onboarding_views/onboarding_view.dart';

import '../../model_data_onboarding/model_onboarding.dart';

class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   List<ModelData> onboardinglist=[
     ModelData(image: "images/page.svg",title: "طلب ركوب",body: "طلب توصيلة يتم اصطحابها من قبل سائق في المكان القريب"),
     ModelData(image: "images/pagesec.svg",title: "تاكيد السائق الخاص بك",body: "تساعدك شبكه السائقينين الضخمه في العثور علي رحلة مريحة وامنه ورخيصة"),
     ModelData(image: "images/pagethre.svg",title: "تتبع رحلتك",body: "تعرف علي سائقك مقدما وكن قادرا علي عرض الموقع الحالي في الوقت الفعلي علي الخريطه"),

   ];
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   int currentPageIndex = 0;
   final PageController _pageController=PageController();
   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey ,
      appBar: AppBar(

        backgroundColor: backgroundcolor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: backgroundcolor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start
              ,children: [
              SizedBox(
                width: 100.w,
                height: 83.h,
                child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    controller: _pageController,
                    itemCount: onboardinglist.length,
                    itemBuilder: (context,index)=> OnboardingView(modelData:onboardinglist[index], pageController: _pageController, currentPage: currentPageIndex,)),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: onboardinglist.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: ycolor,
                  dotColor:wcolor,
                ),
              ),


            ],),
          )
        ),
      ),
    );
  }
}
