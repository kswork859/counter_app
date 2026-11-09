import 'dart:convert';

import 'package:counter_app/models/user/user_model.dart';
import 'package:counter_app/repository/login/login_repository.dart';

class LoginMockRepository implements LoginRepository {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(Duration(seconds: 3));
    final response = {"token": "kswork859", "message": "Login Success"};
    return UserModel.fromJson(response);
  }
}
