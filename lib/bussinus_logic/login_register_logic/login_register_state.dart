part of'login_and_register_logic.dart';

@immutable
abstract class LoginAndRegisterState {}
class AppIntialStates extends LoginAndRegisterState{}
class ShowPasswordDriverState extends LoginAndRegisterState{}
class LoadingDriverApiAppState extends LoginAndRegisterState{}
class SuscessDriverApiAppState extends LoginAndRegisterState{}
class ErorrDriverApiAppState extends LoginAndRegisterState{}
class LoadingUserApiAppState extends LoginAndRegisterState{}
class SuscessUserApiAppState extends LoginAndRegisterState{}
class ErorrUserApiAppState extends LoginAndRegisterState{}
class LoadingSignUpUserApiAppState extends LoginAndRegisterState{}
class SuscessSignUpUserApiAppState extends LoginAndRegisterState{}
class ErorrSignUpUserApiAppState extends LoginAndRegisterState{}
class LoadingSignUpDriverApiAppState extends LoginAndRegisterState{}
class SuscessSignUpDriverApiAppState extends LoginAndRegisterState{}
class ErorrSignUpDriverApiAppState extends LoginAndRegisterState{}

