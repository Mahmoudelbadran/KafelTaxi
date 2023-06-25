import 'package:flutter/material.dart';
import 'package:taxizer/presentation/screens/code_screen/code_login_driver_screen.dart';
import 'package:taxizer/presentation/screens/code_screen/code_signup_driver_screen.dart';
import 'package:taxizer/presentation/screens/code_screen/code_signup_user_screen.dart';
import 'package:taxizer/presentation/screens/confirmation_screen/confirm_signUp/confirmation_Driver_screen.dart';
import 'package:taxizer/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:taxizer/presentation/screens/siginup_screen/signup_driver_screen/siginup_driver_screen.dart';
import 'package:taxizer/presentation/screens/siginup_screen/signup_driver_screen/signup_driver_one.dart';
import 'package:taxizer/presentation/screens/signin_screen/user/signin_user_screen.dart';
import 'package:taxizer/presentation/screens/single_onboarding/single_onboarding.dart';
import '../../core/chang_page/controle_page.dart' as screens;
import '../screens/admin/admin_login_screen.dart';
import '../screens/code_screen/code_login_user_screen.dart';
import '../screens/confirmation_screen/confirm_signUp/confirmation_user_screen.dart';
import '../screens/home_screens/user/home_user_screen.dart';
import '../screens/home_screens/user/person/screens_single_person/history_user_screen/history_user.dart';
import '../screens/home_screens/user/person/screens_single_person/notice_screens/notic_screen.dart';
import '../screens/home_screens/user/person/screens_single_person/rate_screens/rate_done/rate_screen_done.dart';
import '../screens/home_screens/user/person/screens_single_person/rate_screens/ratee_screen.dart';
import '../screens/home_screens/user/person/screens_single_person/update_user_information/update_user_screen.dart';
import '../screens/home_screens/user/program_work/call_contect_user/call_contect_user.dart';
import '../screens/home_screens/user/program_work/call_contect_user/call_content_cancel.dart';
import '../screens/home_screens/user/program_work/program_work_screen.dart';
import '../screens/siginup_screen/signup_driver_screen/signup_driver_done.dart';
import '../screens/siginup_screen/signup_user_screens/signup_user_done.dart';
import '../screens/siginup_screen/signup_user_screens/signup_user_information.dart';
import '../screens/siginup_screen/signup_user_screens/signup_user_number.dart';
import '../screens/signin_screen/driver/signin_driver_screens.dart';
import '../screens/splash_screen/splash_screen.dart';
class AppRouter{

  late Widget startpage;
  Route?onGenerateRoute(RouteSettings settings){
    startpage=const SplashScreen();
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>startpage);
      case screens.OnboardingScreen:
        return MaterialPageRoute(builder: (_)=>const OnboardingScreen());
      case screens.SingleOnBoarding:
        return MaterialPageRoute(builder: (_)=>const SingleOnBoarding());
      case screens.SignInUserScreen:
        return MaterialPageRoute(builder: (_)=>const SignInUserScreen());
      case screens.SignInDriverScreen:
        return MaterialPageRoute(builder: (_)=>const SignInDriverScreen());
      case screens.CodeLoginUserScreen:
        return MaterialPageRoute(builder: (_)=>const CodeLoginUserScreen());
      case screens.CodeLoginDriverScreen:
        return MaterialPageRoute(builder: (_)=>const CodeLoginDriverScreen());
      case screens.SignUpUserScreens:
        return MaterialPageRoute(builder: (_)=>const SignUpUserScreens());
      case screens.SignUpDriverScreen:
        return MaterialPageRoute(builder: (_)=>const SigInUpDriverScreen());
      case screens.CodeSigInUpDriverScreen:
        return MaterialPageRoute(builder: (_)=>const CodeSigInUpDriverScreen());
      case screens.CodeSigInUpUserScreen:
        return MaterialPageRoute(builder: (_)=>const CodeSigInUpUserScreen());
      case screens.ConfirmationUserScreen:
        return MaterialPageRoute(builder: (_)=>const ConfirmationUserScreen());
      case screens.ConfirmationDriverScreen:
        return MaterialPageRoute(builder: (_)=>const ConfirmationDriverScreen());
      case screens.SignUpDriverFirst:
        return MaterialPageRoute(builder: (_)=>const SignUpDriverFirst());
      case screens.SignInUserInformation:
        return MaterialPageRoute(builder: (_)=>const SignInUserInformation());
      case screens.SignInUserDone:
        return MaterialPageRoute(builder: (_)=>const SignInUserDone());
      case screens.SignUpDriverDone:
        return MaterialPageRoute(builder: (_)=>const SignUpDriverDone());
      case screens.AdminLoginScreens:
        return MaterialPageRoute(builder: (_)=>const AdminLoginScreens());
      case screens.HomeUserScreen:
        return MaterialPageRoute(builder: (_)=>const HomeUserScreen());
      case screens.UpdateUser:
        return MaterialPageRoute(builder: (_)=>const UpdateUser());
      case screens.HistoryUser:
        return MaterialPageRoute(builder: (_)=>const HistoryUser());
      case screens.NoticScreen:
        return MaterialPageRoute(builder: (_)=>const NoticScreen());
      case screens.RateScreen:
        return MaterialPageRoute(builder: (_)=>const RateScreen());
      case screens.RateDone:
        return MaterialPageRoute(builder: (_)=>const RateDone());
      case screens.ProgramWorkScreen:
        return MaterialPageRoute(builder: (_)=>const ProgramWorkScreen());
      case screens.CallContentUser:
        return MaterialPageRoute(builder: (_)=>const CallContentUser());
      case screens.CallContentUserCancel:
        return MaterialPageRoute(builder: (_)=>const CallContentUserCancel());


      default:
        return null;
    }
  }
}