import 'package:counter_app/bloc/login/login_bloc.dart';
import 'package:counter_app/bloc/login/login_events.dart';
import 'package:counter_app/bloc/login/login_states.dart';
import 'package:counter_app/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChangedEvent(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }
            if (!Validations.emailValidator(value)) {
              return "Enter a valid email";
            }
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
