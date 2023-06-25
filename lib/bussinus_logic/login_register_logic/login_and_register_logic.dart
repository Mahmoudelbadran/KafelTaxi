import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_register_state.dart';
class LoginAndRegisterLogic extends Cubit<LoginAndRegisterState> {
  LoginAndRegisterLogic() : super(AppIntialStates());

  static LoginAndRegisterLogic get(context) => BlocProvider.of<LoginAndRegisterLogic>(context);
  IconData surFixIcons=Icons.visibility;
  bool isHidden=true;
  void showPasswordDriver(){
  if(isHidden){
    surFixIcons=Icons.visibility_off;
  }
  else{
    surFixIcons=Icons.visibility;
  }
  isHidden=!isHidden;
    emit(ShowPasswordDriverState());

  }

}