import 'dart:convert';

import 'package:counter_app/models/user/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRepository {
  Future<UserModel> loginApi(dynamic data);
}
