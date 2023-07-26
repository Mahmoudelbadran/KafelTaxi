part of'home_driver_logic.dart';

@immutable
abstract class HomeDriveState {}
class AppIntialStates extends HomeDriveState{}
class ChangeClickButtonStates extends HomeDriveState{}
class ShowButtomsheetstates extends HomeDriveState{}
class GetBytesFromAssetState extends HomeDriveState{}
class LoadDataState extends HomeDriveState{}
class SetPolylineState extends HomeDriveState{}
class CallStateUser extends HomeDriveState{}
class LoadingUpdateDriverApiAppState extends HomeDriveState{}
class SuscessUpdateDriverApiAppState extends HomeDriveState{}
class ErorrUpdateDriverApiAppState extends HomeDriveState{}
class LoadingLocationDriverApiAppState extends HomeDriveState{}
class SuscessLocationDriverApiAppState extends HomeDriveState{}
class ErorrLocationDriverApiAppState extends HomeDriveState{}
class LoadingDriverProfile extends HomeDriveState{}
class SucessDriverProfile extends HomeDriveState{}
class ErrorDriverProfile extends HomeDriveState{}
