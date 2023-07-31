import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/presentation/style/style.dart';
import '../../../../bussinus_logic/login_register_logic/login_and_register_logic.dart';
import '../../../view/login_user_view/login_user_view.dart';
class SignInUserScreen extends StatefulWidget {
  const SignInUserScreen({Key? key}) : super(key: key);

  @override
  State<SignInUserScreen> createState() => _SignInUserScreenState();
}

class _SignInUserScreenState extends State<SignInUserScreen> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController numberPhone = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: backgroundcolor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: BlocBuilder<LoginAndRegisterLogic, LoginAndRegisterState>(
            builder: (context, state) {
              return LoginUserView(numberPhone: numberPhone,password: password);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    numberPhone.dispose();
    password.dispose();
    super.dispose();
  }
}
