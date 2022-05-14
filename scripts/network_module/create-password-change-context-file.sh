#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_change_context.g.dart';

@JsonSerializable()
class PasswordChangeContext extends Equatable {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'oldPassword')
  final String oldPassword;

  @JsonKey(name: 'newPassword')
  final String newPassword;

  PasswordChangeContext({required this.email, required this.oldPassword, required this.newPassword});

  @override
  List<Object> get props => [email, oldPassword, newPassword];

  factory PasswordChangeContext.fromJson(Map<String, dynamic> json) =>
      _\$PasswordChangeContextFromJson(json);

  Map<String, dynamic> toJson() => _\$PasswordChangeContextToJson(this);
}
EOF