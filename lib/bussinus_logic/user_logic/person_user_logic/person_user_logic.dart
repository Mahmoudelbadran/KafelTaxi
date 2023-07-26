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
      print("sucess");
      emit(SucessUpDateApiAppState());
    }).catchError((error) {
      emit(ErorrUpDateApiAppState());
    });
  }
  SearchDataHistoryResponse searchDataHistoryResponse=SearchDataHistoryResponse();
  void toHistoryUser({
    required String token,
    required String from,
    required String to,
  }) async {
    emit(LoadingToHistoryApiAppState());

    await AddToHistoryUserRequest()
        .addToHistoryUserRequest(
        from: from,
        to: to,
        token: token)
        .then((value) {
     searchDataHistoryResponse = value;
      print("sucess");
      emit(SucessToHistoryApiAppState());
    }).catchError((error) {
      emit(ErorrToHistoryApiAppState());
    });
  }
  ProfileResponse profileResponse=ProfileResponse();
  void getProfile({
    required String token,
  }) async {
    print("loadingprofile");
    emit(LoadingProfile());
    await ProfileRequest()
        .profileRequest(token: token,)
        .then((value) {
      profileResponse = value;
      print("sucessprofile");
      emit(SucessProfile());
    }).catchError((error) {
      emit(ErrorProfile());
    });
  }
}
