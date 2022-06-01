#!/usr/bin/env bash

# define parameters which are passed in.
NAME=$1
NAME_UPPER_CAMEL_CASE="$(echo "$NAME" | perl -pe 's/(?:^|[^a-z])([a-z0-9])/\u$1/g')"
NAME_CAMEL_CASE="$(tr '[:upper:]' '[:lower:]' <<< "${NAME_UPPER_CAMEL_CASE:0:1}")${NAME_UPPER_CAMEL_CASE:1}"

# define the template.
cat  << EOF
import 'package:core_ui/colors.dart';
import 'package:core_ui/dimens.dart';
import 'package:core_ui/strings.dart';
import 'package:core_ui/widget/loading/loading_view.dart';
import 'package:core_ui/widget/logo/example_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routes/app_routes.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // TODO remove
  final String _email = 'example@example.com';
  final String _password = 'examplePassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(Dimens.paddingLarge),
          child: Obx(
                () => controller.loadingViewVisible.isTrue
                ? LoadingView()
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: Dimens.heightL,
                ),
                const ExampleLogo(),
                const SizedBox(
                  height: Dimens.heightL,
                ),
                TextFormField(
                  key: const Key('loginInputField'),
                  textAlign: TextAlign.center,
                  decoration:
                  const InputDecoration(hintText: Strings.loginHint),
                  controller: _usernameController..text = _email,
                ),
                TextFormField(
                  key: const Key('passwordInputField'),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: Strings.passwordHint),
                  controller: _passwordController..text = _password,
                  obscureText: true,
                ),
                const SizedBox(
                  height: Dimens.heightSmall,
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.login(_email, _password);
                  },
                  child: const Text(Strings.loginButton),
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed(Routes.FORGET_PASSWORD);
                  },
                  child: const Text(Strings.forgetPasswordButton),
                ),
                const SizedBox(
                  height: Dimens.heightSmall,
                ),
                Text(
                  Strings.noAccount,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Dimens.textSizeLarge,
                      color: ColorPalette.colorPrimary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Dimens.heightSmall,
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTRATION);
                  },
                  child: const Text(Strings.signInButton),
                ),
                TextButton(
                    key: const Key('privacyPolicyButton'),
                    child: Text(
                      Strings.privacyPolicy,
                      style: TextStyle(
                          fontSize: Dimens.textSizeLarge,
                          fontWeight: FontWeight.normal,
                          color: ColorPalette.colorPrimary),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.PRIVACY_POLICY);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
EOF

