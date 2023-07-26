
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/data/Remote/request/payment_request/payment_request.dart';
import 'package:taxizer/data/Remote/response/payment_response/payment_response.dart';

part 'payment_state.dart';

class PaymentLogic extends Cubit<PaymentState> {
  PaymentLogic() : super(AppIntialStates());

  static PaymentLogic get(context) => BlocProvider.of<PaymentLogic>(context);
  PaymentResponse paymentResponse=PaymentResponse();
  void getPaymentUser({
    required String token,
  }) async {
    print("loadingpayment");
    emit(LoadingPaymentAppState());
    await PaymentRequest()
        .paymentRequest(token: token,)
        .then((value) {
      paymentResponse = value;
      print("sucesspayment");
      emit(SuscessPaymentAppState());
    }).catchError((error) {
      emit(ErorrPaymentAppState());
    });
  }
}