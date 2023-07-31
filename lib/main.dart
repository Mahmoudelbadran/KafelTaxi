import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/data/local/my_cache.dart';
import 'package:taxizer/presentation/router/approuter.dart';
import 'bussinus_logic/admin_logic/admin_logic.dart';
import 'bussinus_logic/driver_logic/home_driver_logic.dart';
import 'bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'bussinus_logic/payment_logic/payment_logic.dart';
import 'bussinus_logic/update_driver_logic/update_driver_logic.dart';
import 'bussinus_logic/user_logic/comment_logic/comment_logic.dart';
import 'bussinus_logic/user_logic/home_user_logic.dart';
import 'bussinus_logic/user_logic/person_user_logic/person_user_logic.dart';
import 'bussinus_logic/user_logic/system_logic.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'core/my_bloc_observer.dart';

Future<void> backgroundHandar(RemoteMessage message) async {
  String? title = message.notification!.title;
  String? body = message.notification!.body;
  AwesomeNotifications().createNotification(
      content: NotificationContent(id: 123, channelKey: "call_channel",
        title: title,
        body: body,
        category: NotificationCategory.Call,
        wakeUpScreen: true,
        fullScreenIntent: true,
        autoDismissible: false,
        backgroundColor: Colors.orange,

      ),
    actionButtons: [
      NotificationActionButton(key: "Accept", label: "Accept Call",color: Colors.green
          ,autoDismissible: true,
      ),
      NotificationActionButton(key: "Reject", label: "Reject Call",color: Colors.red
        ,autoDismissible: true,
      ),

    ]
  );

}

void main() async {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "call_channel",
      channelName: "Call Channel",
      channelDescription: "Call of calling",
      defaultColor: Colors.red,
      ledColor: Colors.white,
      importance: NotificationImportance.Max,
      channelShowBadge: true,
      locked: true,
      defaultRingtoneType: DefaultRingtoneType.Ringtone,
    )
  ]);
  FirebaseMessaging.onBackgroundMessage(backgroundHandar);
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  MyCache.initcachce();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation, deviceType) {
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
          BlocProvider(
            create: (context) => CommentLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => PaymentLogic(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => UpdateDriverLogic(),
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
