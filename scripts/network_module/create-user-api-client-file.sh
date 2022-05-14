#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:dio/dio.dart' hide Headers;
import 'package:network/api/api-constant.dart';
import 'package:network/model/dto/password_change_context.dart';
import 'package:network/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String baseUrl}) = _UserApiClient;

  @POST('register')
  @Header('Content-Type: application/json')
  Future register(@Body() String email);

  @POST('login')
  @Header('Content-Type: application/json')
  Future<User> login(@Header('Authorization') String authHeader);

  @POST('forgotPassword')
  @Header('Content-Type: application/json')
  Future forgotPassword(@Body() String email);

  @POST('changePassword')
  @Header('Content-Type: application/json')
  Future changePassword(@Header('Authorization') String authHeader,
      @Body() PasswordChangeContext passwordChangeContext);
}
EOF