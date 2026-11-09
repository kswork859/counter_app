import 'dart:convert';

import 'package:counter_app/models/user/user_model.dart';
import 'package:counter_app/repository/login/login_repository.dart';
import 'package:http/http.dart' as http;

class LoginHttpRepository implements LoginRepository {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return UserModel.fromJson(jsonData);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
}
