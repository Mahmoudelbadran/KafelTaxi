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
  Future loginDriver(
      {required String phone,
      required String password,
      required String deviceToken}) async {
    emit(LoadingDriverApiAppState());
    await LoginDriverRequest()
        .loginDriverRequest(
            phone: phone, password: password, deviceToken: deviceToken)
        .then((value) {
      loginDriverResponse = value;
      if (loginDriverResponse.stutus==200) {
        emit(SuscessDriverApiAppState());
      }else{
        emit(ErorrDriverApiAppState());
      }
    }).catchError((error) {
      emit(ErorrDriverApiAppState());
    });
  }

  LoginUserResponse loginUserResponse = LoginUserResponse();
  Future loginUser({
    required String phone,
    required String password,
    required String deviceToken,
  }) async {
    emit(LoadingUserApiAppState());
    try {
      loginUserResponse = await LoginUserRequest().loginUserRequest(
        phone: phone,
        password: password,
        deviceToken: deviceToken,
      );
      if (loginUserResponse.message == "Success 👌") {
        emit(SuscessUserApiAppState());
      } else {
        emit(ErorrUserApiAppState());
      }
    } catch (error) {
      emit(ErorrUserApiAppState());
    }
  }

  String? numberPhone;
  String? firstName;
  String? lastName;
  SignupUserResponse signupUserResponse = SignupUserResponse();
  Future signUpUser({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String addresses,
  }) async {
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
 if(signupUserResponse.message=="Create New User Successfully 😃"){
   emit(SuscessSignUpUserApiAppState());
 }else{
   emit(ErorrSignUpUserApiAppState());
 }

    }).catchError((error) {
      emit(ErorrSignUpUserApiAppState());
    });
  }
  String? numberDriverPhone;
  String? nameDriver;
  String? numberId;
  String? carId;
  String? id;
  SignupDriverResponse signupDriverResponse = SignupDriverResponse();
  Future signUpDriver({
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
      signupDriverResponse = value;
      if(signupDriverResponse.message=="Sign up New Driver Successfully 😃"){
        emit(SuscessSignUpDriverApiAppState());
      }else{
        emit(ErorrSignUpDriverApiAppState());
      }

    }).catchError((error) {
      emit(ErorrSignUpDriverApiAppState());
    });
  }
}
