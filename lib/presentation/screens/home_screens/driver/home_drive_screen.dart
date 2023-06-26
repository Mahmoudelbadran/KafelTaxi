import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/bussinus_logic/driver_logic/home_driver_logic.dart';
import 'package:taxizer/bussinus_logic/user_logic/home_user_logic.dart';
import '../../../../bussinus_logic/user_logic/system_logic.dart';
import '../../../style/style.dart';
import '../../../view/floating_view/driver/search_driver.dart';

class HomeDriveScreen extends StatefulWidget {
  const HomeDriveScreen({Key? key}) : super(key: key);

  @override
  State<HomeDriveScreen> createState() => _HomeDriveScreenState();
}

class _HomeDriveScreenState extends State<HomeDriveScreen> {
  late final cubit = HomeDriveLogic.get(context);
  late final user = HomeUserLogic.get(context);
  late final system = SystemLogic.get(context);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController myMap = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDriveLogic, HomeDriveState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: backgroundcolor,
          floatingActionButton: FloatingActionButton(
            heroTag: "btn3",
            onPressed: () async {
              if (cubit.isBottomSheet) {
                Navigator.pop(context);
              } else {
                cubit.changeButtonSheets(isShow: true, icon: Icons.location_on);
                _scaffoldKey.currentState!
                    .showBottomSheet((context) => Container(
                          color: backgroundcolor,
                          child: SearchDriver(
                            formKey: _formKey,
                            user: user,
                            system: system,
                            myMap: myMap,
                            location: location,
                            drive: cubit,
                          ),
                        ))
                    .closed
                    .then((value) => cubit.changeButtonSheets(
                        isShow: false, icon: Icons.search_outlined));
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
