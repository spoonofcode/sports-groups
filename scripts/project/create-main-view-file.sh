#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:core_ui/strings.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final appBarTitles = const [
    Strings.home,
    Strings.search,
    Strings.schedule,
    Strings.profile
  ];

  var tabIndex = 0.obs;
  var appBarTitle = Strings.home.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    appBarTitle.value = appBarTitles[index];
  }
}
EOF