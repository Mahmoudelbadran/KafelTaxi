part of'person_user_logic.dart';
abstract class PersonUserState {}
class AppIntialStates extends PersonUserState{}
class LoadingUpDateApiAppState extends PersonUserState{}
class SucessUpDateApiAppState extends PersonUserState{}
class ErorrUpDateApiAppState extends PersonUserState{}
class LoadingToHistoryApiAppState extends PersonUserState{}
class SucessToHistoryApiAppState extends PersonUserState{}
class ErorrToHistoryApiAppState extends PersonUserState{}
class LoadingProfile extends PersonUserState{}
class SucessProfile extends PersonUserState{}
class ErrorProfile extends PersonUserState{}
