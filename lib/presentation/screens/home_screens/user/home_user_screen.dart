import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/user_logic/home_user_logic.dart';
import '../../../../bussinus_logic/user_logic/system_logic.dart';
import '../../../../core/chang_page/controle_page.dart';
import '../../../style/style.dart';
import '../../../view/floating_view/floating_view.dart';
class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  late final cubit = HomeUserLogic.get(context);
  late final system = SystemLogic.get(context);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController myMap = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUserLogic, HomeUserState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: backgroundcolor,
          floatingActionButton: FloatingActionButton(
            heroTag: "btn2",
            onPressed: () async {
              if (cubit.isBottomSheet) {
                Navigator.pushNamed(context, ProgramWorkScreen);
              } else {
                cubit.changeBottonSheets(
                    isShow: true, icon: Icons.send_outlined);
                _scaffoldKey.currentState!
                    .showBottomSheet((context) => Container(
                          width: 100.w,
                          height: 50.h,
                          color: backgroundcolor,
                          child: FloatView(formKey: _formKey,cubit: cubit,system: system,myMap: myMap,location: location,),
                        ))
                    .closed
                    .then((value) => cubit.changeBottonSheets(
                        isShow: false, icon: Icons.add));
              }
            },
            backgroundColor: ycolor,
            child: Icon(cubit.floatingIcon),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: cubit.iconList,
            backgroundColor: wcolor,
            inactiveColor: Colors.black,
            activeColor: ycolor,
            elevation: 5,
            shadow: Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 1),
            activeIndex: cubit.x,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) {
              cubit.changeclickebuton(index);
            },
            //other params
          ),
          extendBody: true,
          body: SafeArea(child: cubit.changePages()),
        );
      },
    );
  }

  @override
  void dispose() {
    myMap.dispose();
    location.dispose();

    super.dispose();
  }
}
