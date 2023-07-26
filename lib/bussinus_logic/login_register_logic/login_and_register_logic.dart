import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/data/Remote/request/driver/login/login_driver_request.dart';
import 'package:taxizer/data/Remote/request/user/login_request/login_user_request.dart';
import 'package:taxizer/data/Remote/request/user/signup_request/signup_user_request.dart';
import 'package:taxizer/data/Remote/response/driver/login_response/login_driver_response.dart';
import 'package:taxizer/data/Remote/response/user/login_user_response/login_user_response.dart';

import '../../data/Remote/request/driver/signup_driver_requset/signup_driver_requset.dart';
import '../../data/Remote/response/driver/signup_driver_response/signup_driver_response.dart';
import '../../data/Remote/response/user/signup_response/signup_user_response.dart';
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
      required String deviceToken}) async {
    emit(LoadingDriverApiAppState());

    await LoginDriverRequest()
        .loginDriverRequest(
            phone: phone, password: password, deviceToken: deviceToken)
        .then((value) {
      loginDriverResponse = value;
      emit(SuscessDriverApiAppState());
    }).catchError((error) {
      emit(ErorrDriverApiAppState());
    });
  }

  LoginUserResponse loginUserResponse = LoginUserResponse();
  void loginUser(
      {required String phone,
      required String password,
      required String deviceToken}) async {
    emit(LoadingUserApiAppState());
    await LoginUserRequest()
        .loginUserRequest(
            phone: phone, password: password, deviceToken: deviceToken)
        .then((value) {
      loginUserResponse = value;
      emit(SuscessUserApiAppState());
    }).catchError((error) {
      emit(ErorrUserApiAppState());
    });
  }

  String? numberPhone;
  String? firstName;
  String? lastName;
  SignupUserResponse signupUserResponse = SignupUserResponse();
  void signUpUser({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String addresses,
  }) async {
    print("Loading1111");
    emit(LoadingSignUpUserApiAppState());
    await SignUpUserRequest()
        .signUpUserRequest(
            userName: userName,
            email: email,
            phone: phone,
            password: password,
            confirmPassword: confirmPassword,
            addresses: addresses)
        .then((value) {
      signupUserResponse = value;
      print("sucess");
      emit(SuscessSignUpUserApiAppState());
    }).catchError((error) {
      print("Error is:$error");
      emit(ErorrSignUpUserApiAppState());
    });
  }
  String? numberDriverPhone;
  String? nameDriver;
  String? numberId;
  String? carId;
  String? id;
  SignupDriverResponse signupDriverResponse = SignupDriverResponse();
  void signUpDriver({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String addresses,
    required String carType,
    required String carId,
    required String listId,
    required String id,
  }) async {
    emit(LoadingSignUpDriverApiAppState());
    print("loading");
    await SignUpDriverRequest()
        .signUpDriverRequest(
            userName: userName,
            email: email,
            phone: phone,
            password: password,
            confirmPassword: confirmPassword,
            addresses: addresses,
      carId: carId,
      carType: carType,
      id: id,
      listId: listId
    )
        .then((value) {
      print("sucess1425555");
      signupDriverResponse = value;
      emit(SuscessSignUpDriverApiAppState());
    }).catchError((error) {
      print("error this:$error");
      emit(ErorrSignUpDriverApiAppState());
    });
  }
}
