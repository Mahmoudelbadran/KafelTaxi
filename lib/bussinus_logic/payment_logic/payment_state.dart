part of'payment_logic.dart';


abstract class PaymentState {}
class AppIntialStates extends PaymentState{}
class LoadingPaymentAppState extends PaymentState{}
class SuscessPaymentAppState extends PaymentState{}
class ErorrPaymentAppState extends PaymentState{}