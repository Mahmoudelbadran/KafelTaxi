part of'admin_logic.dart';


abstract class AdminState {}
class AppIntialStates extends AdminState{}
class LoadingAdminState extends AdminState {}
class SuccessAdminState extends AdminState {}
class ErrorAdminState extends AdminState {}
class LoadingGetAllState extends AdminState{}
class SuscessGetAllState extends AdminState{}
class ErorrGetAllState extends AdminState{}
class LoadingGetAllDriverState extends AdminState{}
class SuscessGetAllDriverState extends AdminState{}
class ErorrGetAllDriverState extends AdminState{}
class LoadingGetAllPaymentState extends AdminState{}
class SuscessGetAllPaymentState extends AdminState{}
class ErorrGetAllPaymentState extends AdminState{}
class LoadingGetAllDriverRequestState extends AdminState{}
class SuscessGetAllDriverRequestState extends AdminState{}
class ErorrGetAllDriverRequestState extends AdminState{}
class LoadingAdminActiveState extends AdminState{}
class SuscessAdminActiveState extends AdminState{}
class ErorrAdminActiveState extends AdminState{}
class LoadingPaymentByIdState extends AdminState{}
class SuscessPaymentByIdState extends AdminState{}
class ErrorPaymentByIdState extends AdminState{}
class LoadingDeleteUserState extends AdminState{}
class DeleteUserState extends AdminState{}
class LoadingDeleteDriverState extends AdminState{}
class DeleteDriverState extends AdminState{}

