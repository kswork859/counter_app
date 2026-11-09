import 'package:counter_app/bloc/login/login_events.dart';
import 'package:counter_app/bloc/login/login_states.dart';
import 'package:counter_app/repository/login/login_repository.dart';
import 'package:counter_app/services/session_manager/session_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginStates()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginApiHitEvent>(_onLoginApiHit);
  }

  void _onEmailChanged(EmailChangedEvent events, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: events.email));
  }

  void _onPasswordChanged(
    PasswordChangedEvent events,
    Emitter<LoginStates> emit,
  ) {
    emit(state.copyWith(password: events.password));
  }

  void _onLoginApiHit(LoginApiHitEvent event, Emitter<LoginStates> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading, message: "Loading"));
    Map data = {'email': state.email, 'password': state.password};
    final response = await loginRepository.loginApi(data);
    await SessionController().saveUserInPreference({
      'token': response.token,
      'isLoggedIn': true,
    });

    await SessionController().getUserFromPreference();
    emit(
      state.copyWith(
        email: state.email,
        password: state.password,
        message: response.message,
        loginStatus: LoginStatus.success,
      ),
    );
  }
}
