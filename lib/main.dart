import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/router/approuter.dart';
import 'bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'bussinus_logic/user_logic/home_user_logic.dart';
import 'bussinus_logic/user_logic/system_logic.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation,
        DeviceType deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<LoginAndRegisterLogic>(
            create: (context) => LoginAndRegisterLogic(),
            lazy: true,
          ),
          BlocProvider<HomeUserLogic>(
            create: (context) => HomeUserLogic(),
            lazy: true,
          ),
          BlocProvider<SystemLogic>(
            create: (context) => SystemLogic(),
            lazy: true,
          ),

        ],
        child: MaterialApp(
          title: "كفل حارس",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      );
    });
  }
}
