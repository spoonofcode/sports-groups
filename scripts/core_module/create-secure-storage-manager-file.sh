#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  final _storage = const FlutterSecureStorage();
  final loginKey = 'LOGIN';
  final passwordKey = 'PASSWORD';

  Future<String?> getLogin() {
    return _storage.read(key: loginKey);
  }

  Future<void> setLogin(String? loginValue) async {
    await _storage.write(key: loginKey, value: loginValue);
  }

  Future<String?> getEncryptedPassword() async {
    return await _storage.read(key: passwordKey);
  }

  Future<void> setEncryptedPassword(String? passwordValue) async {
    await _storage.write(key: passwordKey, value: passwordValue);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
EOF