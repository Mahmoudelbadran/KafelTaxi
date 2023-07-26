import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Remote/request/driver/update_request/update_driver_request.dart';
import '../../data/Remote/response/driver/update_driver_response/update_driver_response.dart';

part 'update_driver_state.dart';

class UpdateDriverLogic extends Cubit<UpdateDriverState> {
  UpdateDriverLogic() : super(AppIntialStates());

  static UpdateDriverLogic get(context) =>
      BlocProvider.of<UpdateDriverLogic>(context);
  UpdateDriverResponse updateDriverResponse = UpdateDriverResponse();
  void updateDriver({
    required String email,
    required String password,
    required String confirmPassword,
    required String addresses,
    required String token,
  }) async {
    print("loadingpayment");
    emit(LoadingUpDateDriverAppState());
    await UpDateDriverRequest()
        .upDateDriverRequest(
            token: token,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            addresses: addresses)
        .then((value) {
      updateDriverResponse = value;
      print("sucesspayment");
      emit(SuscessUpDateDriverAppState());
    }).catchError((error) {
      emit(ErorrUpDateDriverAppState());
    });
  }
}
