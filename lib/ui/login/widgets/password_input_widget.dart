import 'package:counter_app/bloc/login/login_bloc.dart';
import 'package:counter_app/bloc/login/login_events.dart';
import 'package:counter_app/bloc/login/login_states.dart';
import 'package:counter_app/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(
              PasswordChangedEvent(password: value),
            );
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter password";
            }
            if (value.length < 6) {
              return "Password should be atleast 6 characters long";
            }
            
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
