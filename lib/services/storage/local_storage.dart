import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = FlutterSecureStorage();

  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<dynamic> readValue(String key) async {
    await storage.read(key: key);
  }

  Future<bool> deleteKey(String key, String value) async {
    await storage.delete(key: key);
    return true;
  }
}
