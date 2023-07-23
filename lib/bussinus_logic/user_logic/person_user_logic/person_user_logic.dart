import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/Remote/request/user/update_user_request/update_user_request.dart';
import '../../../data/Remote/response/user/update_user_response/update_user_response.dart';

part 'person_user_state.dart';

class PersonUserLogic extends Cubit<PersonUserState> {
  PersonUserLogic() : super(AppIntialStates());

  static PersonUserLogic get(context) =>
      BlocProvider.of<PersonUserLogic>(context);

  UpdateUserResponse updateUserResponse = UpdateUserResponse();
  void upDateUser(
      {required String token,
      required String password,
      required String email,
      required String address,
      required String confirmPassword}) async {
    emit(LoadingUpDateApiAppState());

    await UpDateUserRequest()
        .upDateUserRequest(
            confirmPassword: confirmPassword,
            password: password,
            email: email,
            addresses: address,
            token: token)
        .then((value) {
      updateUserResponse = value;
      emit(SucessUpDateApiAppState());
    }).catchError((error) {
      emit(ErorrUpDateApiAppState());
    });
  }
}
