#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:network/model/user.dart';

abstract class UserRepository {
  Future register(String mailJson);

  Future<User?> login(String authHeader);

  Future forgotPassword(String email);

  Future changePassword(
      String authHeader, String email, String oldPassword, String newPassword);
}
EOF