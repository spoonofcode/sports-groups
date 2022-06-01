#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:get/get.dart';
import 'package:home/home_binding.dart';
import 'package:home/home_view.dart';
import 'package:login/login_binding.dart';
import 'package:login/login_view.dart';
import 'package:messages/messages_binding.dart';
import 'package:messages/messages_view.dart';
import 'package:notifications/notifications_binding.dart';
import 'package:notifications/notifications_view.dart';
import 'package:profile/profile_binding.dart';
import 'package:profile/profile_view.dart';
import 'package:routes/app_routes.dart';
import 'package:schedule/schedule_binding.dart';
import 'package:schedule/schedule_view.dart';
import 'package:search/search_binding.dart';
import 'package:search/search_view.dart';
import 'package:sports_groups/main/main_binding.dart';
import 'package:sports_groups/main/main_view.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: Routes.REGISTRATION,
    //   page: () => const RegistrationView(),
    //   binding: RegistrationBinding(),
    // ),
    // GetPage(
    //   name: Routes.FORGET_PASSWORD,
    //   page: () => const ForgetPasswordView(),
    //   binding: ForgetPasswordBinding(),
    // ),
    // GetPage(
    //   name: Routes.PRIVACY_POLICY,
    //   page: () => const PrivacyPolicyView(),
    //   binding: PrivacyPolicyBinding(),
    // ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
  ];
}
EOF