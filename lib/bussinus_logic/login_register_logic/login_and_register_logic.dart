import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/data/Remote/request/driver/login/login_driver_request.dart';
import 'package:taxizer/data/Remote/request/user/login_request/login_user_request.dart';
import 'package:taxizer/data/Remote/response/driver/login_response/login_driver_response.dart';
import 'package:taxizer/data/Remote/response/user/login_user_response/login_user_response.dart';
part 'login_register_state.dart';

class LoginAndRegisterLogic extends Cubit<LoginAndRegisterState> {
  LoginAndRegisterLogic() : super(AppIntialStates());

  static LoginAndRegisterLogic get(context) =>
      BlocProvider.of<LoginAndRegisterLogic>(context);
  IconData surFixIcons = Icons.visibility;
  bool isHidden = true;
  void showPasswordDriver() {
    if (isHidden) {
      surFixIcons = Icons.visibility_off;
    } else {
      surFixIcons = Icons.visibility;
    }
    isHidden = !isHidden;
    emit(ShowPasswordDriverState());
  }

  LoginDriverResponse loginDriverResponse = LoginDriverResponse();
  void loginDriver(
      {required String phone,
      required String password,
      required String deviceToken}) {
    emit(LoadingDriverApiAppState());

    LoginDriverRequest()
        .loginDriverRequest(
            phone: phone, password: password, deviceToken: deviceToken)
        .then((value) {
      loginDriverResponse = value;
      emit(SuscessDriverApiAppState());
      print("sucessLogin");
    }).catchError((error) {
      print("this error logic:$error");
      emit(ErorrDriverApiAppState());
    });
  }

  LoginUserResponse loginUserResponse = LoginUserResponse();
  void loginUser(
      {required String phone,
      required String password,
      required String deviceToken}) {
    emit(LoadingUserApiAppState());

    LoginUserRequest()
        .loginUserRequest(
            phone: phone, password: password, deviceToken: deviceToken)
        .then((value) {
      loginUserResponse = value;
      emit(SuscessUserApiAppState());
      print("sucessLogin");
    }).catchError((error) {
      print("this error logic:$error");
      emit(ErorrUserApiAppState());
    });
  }
}
