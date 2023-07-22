part of'login_and_register_logic.dart';

@immutable
abstract class LoginAndRegisterState {}
class AppIntialStates extends LoginAndRegisterState{}
class ShowPasswordDriverState extends LoginAndRegisterState{}
class LoadingDriverApiAppState extends LoginAndRegisterState{}
class SuscessDriverApiAppState extends LoginAndRegisterState{}
class ErorrDriverApiAppState extends LoginAndRegisterState{}


