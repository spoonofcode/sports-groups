#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:core/secure_storage_manager.dart';

class CredentialsHolder {
  SecureStorageManager storageManager = SecureStorageManager();

  CredentialsHolder();

  String? _login;
  String? _password;

  Future<String?> getLogin() async  {
    _login = await storageManager.getLogin();
    return _login;
  }

  void setLogin(String value) {
    _login = value;
    storageManager.setLogin(_login!);
  }

  Future<String?> getPassword() async  {
    _password = await storageManager.getEncryptedPassword();
    return _password;
  }

  void setPassword(String value) {
    _password = value;
    storageManager.setEncryptedPassword(_password!);
  }

  void clear() {
    storageManager.setLogin(null);
    storageManager.setEncryptedPassword(null);
  }
}
EOF