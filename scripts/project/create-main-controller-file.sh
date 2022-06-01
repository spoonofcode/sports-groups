#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:core_ui/colors.dart';
import 'package:core_ui/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/home_view.dart';
import 'package:profile/profile_view.dart';
import 'package:routes/app_routes.dart';
import 'package:schedule/schedule_view.dart';
import 'package:search/search_view.dart';
import 'package:get/get.dart';


import 'main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const SearchView(),
    const ScheduleView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    controller.changeTabIndex(index);
  }

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          // Used for removing back buttoon.
          title: Text(controller.appBarTitle.value),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_box_outlined),
              color: ColorPalette.colorPrimary,
              tooltip: 'Show Profile view',
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
            ),
            IconButton(
              icon: const Icon(Icons.notification_important_outlined),
              color: ColorPalette.colorPrimary,
              tooltip: 'Show Profile view',
              onPressed: () {
                Get.toNamed(Routes.NOTIFICATIONS);
              },
            ),
            IconButton(
              icon: const Icon(Icons.message),
              color: ColorPalette.colorPrimary,
              tooltip: 'Show Profile view',
              onPressed: () {
                Get.toNamed(Routes.MESSAGES);
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: _widgetOptions,
        ),
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      ),
    );
  }

  Obx buildBottomNavigationMenu(context, controller) => Obx(
        () => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SizedBox(
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: _onItemTapped,
              currentIndex: controller.tabIndex.value,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              selectedItemColor: Colors.white,
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle,
              backgroundColor: ColorPalette.colorPrimary,
              // onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: ColorPalette.colorPrimary,
                  icon: Icon(Icons.home),
                  label: Strings.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: Strings.search,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: Strings.schedule,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: Strings.profile,
                ),
              ],
            ),
          ),
        ),
      );
}
EOF