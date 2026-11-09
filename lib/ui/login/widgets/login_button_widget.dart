import 'package:counter_app/bloc/login/login_bloc.dart';
import 'package:counter_app/bloc/login/login_events.dart';
import 'package:counter_app/bloc/login/login_states.dart';
import 'package:counter_app/ui/posts/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostScreen()),
          );
        }
        if (state.loginStatus == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.message.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          print(state.message.toString());
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApiHitEvent());
              }
            },
            child: Text("Login"),
          );
        },
      ),
    );
  }
}
