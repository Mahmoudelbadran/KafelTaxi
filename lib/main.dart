import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/router/approuter.dart';
import 'bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'bussinus_logic/user_logic/home_user_logic.dart';
import 'bussinus_logic/user_logic/system_logic.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(
    DevicePreview(
    builder: (context) => MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation,
         deviceType) {
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
