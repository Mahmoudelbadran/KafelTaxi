import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/data/Remote/response/admin/all_driver_response/all_driver_response.dart';

import '../../data/Remote/request/admin/admin_driver_request/admin_driver_request.dart';
import '../../data/Remote/request/admin/all_driver_request/all_driver_request.dart';
import '../../data/Remote/request/admin/all_user_request/all_user_request.dart';
import '../../data/Remote/request/admin/delete_driver.dart';
import '../../data/Remote/request/admin/delete_user.dart';
import '../../data/Remote/request/admin/edit_driver_request/edit_driver_request.dart';
import '../../data/Remote/request/admin/get_all_payments/get_all_payments.dart';
import '../../data/Remote/request/admin/login/login_request.dart';
import '../../data/Remote/request/admin/payment_by_id/payment_all_by_id.dart';
import '../../data/Remote/response/admin/admin_driver_response/admin_driver_response.dart';
import '../../data/Remote/response/admin/all_user_response/all_user_response.dart';
import '../../data/Remote/response/admin/edit_driver_response/edit_driver_response.dart';
import '../../data/Remote/response/admin/get_all_payment_response/get_all_payment_response.dart';
import '../../data/Remote/response/admin/login_response/login_response.dart';
import '../../data/Remote/response/admin/payment_by_response/payment_by_response.dart';
import '../../data/Remote/response/delete_driver_response/delete_driver_response.dart';
import '../../data/Remote/response/delete_user_response/delete_user_response.dart';


part 'admin_state.dart';

class AdminLogic extends Cubit<AdminState> {
  AdminLogic() : super(AppIntialStates());

  static AdminLogic get(context) => BlocProvider.of<AdminLogic>(context);

  LoginResponse loginResponse=LoginResponse();
  Future login({required String username,required String password}) async{
    emit(LoadingAdminState());

    try {
      final response = await LoginRequest().loginRequest(username: username, password: password);
      loginResponse = response;
      if(loginResponse.message == "Success 👌"){
        emit(SuccessAdminState());
      }else{
        emit(ErrorAdminState());
      }
    } catch (error) {
      emit(ErrorAdminState());
    }
  }
  AllUserResponse allUserResponse=AllUserResponse();
  Future getAllUser({required String token}) async{
    emit(LoadingGetAllState());

    try {
      final response = await AllUserRequest().allUserRequest(token: token);
      allUserResponse = response;
      emit(SuscessGetAllState());
    } catch (error) {
      emit(ErorrGetAllState());
    }
  }
  AllDriverResponse allDriverResponse=AllDriverResponse();
  Future getAllDriver({required String token}) async{
    emit(LoadingGetAllDriverState());

    try {
      final response = await AllDriverRequest().allDriverRequest(token: token);
      allDriverResponse = response;
      emit(SuscessGetAllDriverState());
    } catch (error) {
      emit(ErorrGetAllDriverState());
    }
  }
  GetAllPaymentResponse getAllPaymentResponse=GetAllPaymentResponse();
  Future allPayment({required String token}) async{
    emit(LoadingGetAllPaymentState());

    try {
      final response = await GetAllPayment().getAllPayment(token: token);
      getAllPaymentResponse = response;
      emit(SuscessGetAllPaymentState());
    } catch (error) {
      emit(ErorrGetAllPaymentState());
    }
  }
  AdminDriverResponse adminDriverResponse=AdminDriverResponse();
  Future getDriverRequest({required String token}) async{
    emit(LoadingGetAllDriverRequestState());

    try {
      final response = await AdminDriverRequest().adminDriverRequest(token: token);
      adminDriverResponse = response;
      emit(SuscessGetAllDriverRequestState());
    } catch (error) {
      emit(ErorrGetAllDriverRequestState());
    }
  }
  EditDriverResponse editDriverResponse=EditDriverResponse();
  Future updateDriver({required String token,
    required String driverId,
    required bool complete
  }) async{
    emit(LoadingAdminActiveState());

    try {
      final response = await EditDriverRequest().editDriverRequest( driverId: driverId, complete: complete,token: token);
      editDriverResponse = response;
      emit(SuscessAdminActiveState());
    } catch (error) {
      emit(ErorrAdminActiveState());
    }
  }
  PaymentByResponse paymentByResponse=PaymentByResponse();
  Future paymentAllById({
    required String driverId,
    required String token
  }) async{
    emit(LoadingPaymentByIdState());

    try {
      final response = await PaymentByIdRequest().paymentByIdRequest( id: driverId, token: token);
      paymentByResponse = response;
      if(paymentByResponse.message=="All payments"){
        emit(SuscessPaymentByIdState());
      }
    } catch (error) {
      emit(ErrorPaymentByIdState());
    }
  }
  DeleteUserResponse deleteUserResponse=DeleteUserResponse();
  Future deleteUserLogic({
    required String driverId,
    required String token
  }) async{
    try {
      emit(LoadingDeleteUserState());
      final response = await DeleteUser().deleteUser( id: driverId, token: token);
      deleteUserResponse = response;
        emit(DeleteUserState());
    } catch (error) {
      emit(DeleteUserState());
    }
  }
  DeleteDriverResponse deleteDriverResponse=DeleteDriverResponse();
  Future deleteDriver({
    required String driverId,
    required String token
  }) async{
    try {
      emit(LoadingDeleteDriverState());
      final response = await DeleteDriverRequest().deleteDriverRequest( id: driverId, token: token);
      deleteDriverResponse = response;
      emit(DeleteDriverState());
    } catch (error) {
      emit(DeleteDriverState());
    }
  }
}