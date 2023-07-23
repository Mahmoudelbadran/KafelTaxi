import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Remote/request/admin/login/login_request.dart';
import '../../data/Remote/response/admin/login_response/login_response.dart';


part 'admin_state.dart';

class AdminLogic extends Cubit<AdminState> {
  AdminLogic() : super(AppIntialStates());

  static AdminLogic get(context) => BlocProvider.of<AdminLogic>(context);

  LoginResponse loginResponse=LoginResponse();
  void login({required String username,required String password}) async{
    emit(LoadingApiAppState());

 await LoginRequest().loginRequest(username: username, password: password)
        .then((value) {
      loginResponse = value;
      emit(SuscessApiAppState());
    }).catchError((error) {
      emit(ErorrApiAppState());
    });
  }
  }