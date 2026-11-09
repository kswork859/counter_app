import 'package:counter_app/bloc/login/login_bloc.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFoucsNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  EmailInputWidget(emailFocusNode: emailFoucsNode),
                  SizedBox(height: 10),
                  PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                  LoginButtonWidget(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
