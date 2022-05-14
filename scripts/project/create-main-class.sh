#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:core/get_storage_keys.dart';
import 'package:core/global_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sports_groups/routes/app_routes.dart';
import 'package:sports_groups/app_pages.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  await GetStorage().write(GetStorageKeys.exampleText, "Example Text");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialBinding: GlobalBinding(),
      initialRoute: Routes.LOGIN,
    );
  }
}
EOF