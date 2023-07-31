
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/login_register_logic/login_and_register_logic.dart';
import 'package:taxizer/presentation/style/style.dart';
import '../../../view/login_driver_view/login_driver_view.dart';

class SignInDriverScreen extends StatefulWidget {
  const SignInDriverScreen({Key? key}) : super(key: key);

  @override
  State<SignInDriverScreen> createState() => _SignInDriverScreenState();
}

class _SignInDriverScreenState extends State<SignInDriverScreen> {
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
              return LoginDriverView(
                numberPhone: numberPhone,
                password: password,
              );
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
