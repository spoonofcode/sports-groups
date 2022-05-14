#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'firstname')
  final String firstname;

  @JsonKey(name: 'lastname')
  final String lastname;

  User(
      {required this.email, required this.firstname, required this.lastname});

  @override
  List<Object?> get props => [
        email,
        firstname,
        lastname,
      ];

  factory User.fromJson(Map<String, dynamic> json) =>
      _\$UserFromJson(json);

  Map<String, dynamic> toJson() => _\$UserToJson(this);
}
EOF