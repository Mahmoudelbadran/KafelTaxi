import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/data/Remote/response/profile_response/profile_response.dart';

import '../../../data/Remote/request/profile/profile_request.dart';
import '../../../data/Remote/request/user/add_to_history/add_to_history_request.dart';
import '../../../data/Remote/request/user/update_user_request/update_user_request.dart';
import '../../../data/Remote/response/user/search_history_data/search_data_history_response.dart';
import '../../../data/Remote/response/user/update_user_response/update_user_response.dart';

part 'person_user_state.dart';

class PersonUserLogic extends Cubit<PersonUserState> {
  PersonUserLogic() : super(AppIntialStates());

  static PersonUserLogic get(context) =>
      BlocProvider.of<PersonUserLogic>(context);

  UpdateUserResponse updateUserResponse = UpdateUserResponse();
  Future upDateUser(
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
  String from='';
  String to='';
  double distance=0;
  SearchDataHistoryResponse searchDataHistoryResponse=SearchDataHistoryResponse();
  Future toHistoryUser({
    required String token,
  }) async {
    emit(LoadingToHistoryApiAppState());

    await AddToHistoryUserRequest()
        .addToHistoryUserRequest(
        from: from,
        to: to,
        token: token)
        .then((value) {
     searchDataHistoryResponse = value;
      emit(SucessToHistoryApiAppState());
    }).catchError((error) {
      emit(ErorrToHistoryApiAppState());
    });
  }
  ProfileResponse profileResponse=ProfileResponse();
  Future getProfile({
    required String token,
  }) async {
    emit(LoadingProfile());
    await ProfileRequest()
        .profileRequest(token: token,)
        .then((value) {
      profileResponse = value;
      emit(SucessProfile());
    }).catchError((error) {
      emit(ErrorProfile());
    });
  }
}
