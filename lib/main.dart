import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/data/Remote/drive/sign_up_api/sign_up.dart';
import 'package:taxizer/presentation/router/approuter.dart';
import 'bussinus_logic/driver_logic/home_driver_logic.dart';
import 'bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'bussinus_logic/user_logic/home_user_logic.dart';
import 'bussinus_logic/user_logic/system_logic.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
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
          BlocProvider<HomeDriveLogic>(
            create: (context) => HomeDriveLogic(),
            lazy: true,
          ),
          BlocProvider<SignUpUserApi>(
            create: (context) => SignUpUserApi(),
            lazy: false,
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