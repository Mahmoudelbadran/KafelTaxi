import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'sign_upstate.dart';
class SignUpUserApi extends Cubit<SignUpUserState> {
  SignUpUserApi() : super(AppIntialStates());
  static SignUpUserApi get(context) => BlocProvider.of<SignUpUserApi>(context);
   String first='';
  String last='';
  String numPhone='';
  Future<void> postData (
      { required String nameFirst,
        required String nameLast,
        required String phone,
        required String emailR,
        required String password,
        required String passwordConfirmation,
        required String adress}) async {
    const url = 'https://mim-plastic.com/sign-up';
    final Map<String, dynamic> formData = {
      'firstName': nameFirst,
      'lastName': nameLast,
      'email': emailR,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'number': phone,
      'dressName': adress
    };
    final response = await http.post(Uri.parse(url), body: formData);
    if (response.statusCode == 200) {
      emit(SucessSignUpUser());
    } else {
     emit(ErrorSignUpUser());
    }
  }
}