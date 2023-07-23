import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/router/approuter.dart';
import 'bussinus_logic/admin_logic/admin_logic.dart';
import 'bussinus_logic/driver_logic/home_driver_logic.dart';
import 'bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'bussinus_logic/user_logic/home_user_logic.dart';
import 'bussinus_logic/user_logic/person_user_logic/person_user_logic.dart';
import 'bussinus_logic/user_logic/system_logic.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
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
          BlocProvider(
            create: (context) => LoginAndRegisterLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => HomeUserLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => SystemLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => HomeDriveLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => AdminLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => PersonUserLogic(),
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