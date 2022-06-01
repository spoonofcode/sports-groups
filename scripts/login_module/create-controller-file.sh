#!/usr/bin/env bash

# define parameters which are passed in.
NAME=$1
NAME_UPPER_CAMEL_CASE="$(echo "$NAME" | perl -pe 's/(?:^|[^a-z])([a-z0-9])/\u$1/g')"
NAME_CAMEL_CASE="$(tr '[:upper:]' '[:lower:]' <<< "${NAME_UPPER_CAMEL_CASE:0:1}")${NAME_UPPER_CAMEL_CASE:1}"

# define the template.
cat  << EOF
import 'package:get/get.dart';
import 'package:routes/app_routes.dart';

import 'login_use_case.dart';

// import 'package:axxiome_onboarding_app/login/login_event_args.dart';
// import 'package:axxiome_onboarding_app/routes/app_pages.dart';
// import 'package:event/src/event.dart';
import 'package:get/get.dart';

import 'login_use_case.dart';

class LoginController extends GetxController {
  // final Event<LoginEventArgs> loginEvent;
  final LoginUseCase loginUseCase;

  // LoginController({required this.loginEvent, required this.loginUseCase});
  LoginController({required this.loginUseCase});

  final RxBool loadingViewVisible = false.obs;

  @override
  void onInit() {
    // _checkCredentials();
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    await _navigateToNextScreen();

    // loadingViewVisible.value = true;
    // try {
    //   await loginUseCase.login(email, password);
    //   await _navigateToNextScreen();
    // } catch (err) {
    //   loginEvent.broadcast(LoginEventArgs.showError(err.toString()));
    //   rethrow;
    // } finally {
    //   loadingViewVisible.value = false;
    // }
  }

  // region Private methods
  // Future<void> _checkCredentials() async {
  //   try {
  //     var hasCredentials = await loginUseCase.hasCredentials();
  //     if (hasCredentials) {
  //       await _navigateToNextScreen();
  //     }
  //   } catch (err) {
  //     loginEvent.broadcast(LoginEventArgs.showError(err.toString()));
  //     rethrow;
  //   } finally {
  //     loadingViewVisible.value = false;
  //   }
  // }

  Future<void> _navigateToNextScreen() async {
      await Get.offAllNamed(Routes.MAIN);
  }
// endregion
}


EOF