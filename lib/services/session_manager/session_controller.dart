import 'dart:convert';

import 'package:counter_app/models/user/user_model.dart';
import 'package:counter_app/services/storage/local_storage.dart';
import 'package:flutter/foundation.dart';

class SessionController {
  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLoggedin;
  static final SessionController _session = SessionController._internal();
  SessionController._internal() {
    isLoggedin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLoggedin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLoggedin = await localStorage.readValue('isLoggedin');

      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLoggedin = isLoggedin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
