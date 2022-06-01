#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home/home_controller.dart';
import 'package:home/home_use_case.dart';
import 'package:messages/messages_controller.dart';
import 'package:messages/messages_use_case.dart';
import 'package:notifications/notifications_controller.dart';
import 'package:notifications/notifications_use_case.dart';
import 'package:profile/profile_controller.dart';
import 'package:profile/profile_use_case.dart';
import 'package:schedule/schedule_controller.dart';
import 'package:schedule/schedule_use_case.dart';
import 'package:search/search_controller.dart';
import 'package:search/search_use_case.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
          homeUseCase: Get.put(HomeUseCase(getStorage: Get.put(GetStorage())))),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(
          searchUseCase:
              Get.put(SearchUseCase(getStorage: Get.put(GetStorage())))),
    );
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(
          scheduleUseCase:
              Get.put(ScheduleUseCase(getStorage: Get.put(GetStorage())))),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(
          profileUseCase: ProfileUseCase(getStorage: Get.put(GetStorage()))),
    );
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(
          notificationsUseCase:
              Get.put(NotificationsUseCase(getStorage: Get.put(GetStorage())))),
    );
    Get.lazyPut<MessagesController>(
          () => MessagesController(
              messagesUseCase:
          Get.put(MessagesUseCase(getStorage: Get.put(GetStorage())))),
    );
  }
}
EOF