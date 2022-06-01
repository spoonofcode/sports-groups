#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'dart:io';

import 'package:core/get_storage_keys.dart';
import 'package:core/global_binding.dart';
// import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:shared/common/common.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:routes/app_routes.dart';
import 'package:sports_groups/main/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  GetStorage().write(GetStorageKeys.exampleText, "Example Text");

  // Fimber.plantTree(DebugTree());

  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  // WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));

  // // TODO check why whitout this is problem with certificate
  // // https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req
  // HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      //   brightness: Brightness.light,
      //   primaryColor: ColorPalette.colorPrimary,
      //   primaryColorDark: ColorPalette.colorPrimaryDark,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   appBarTheme: AppBarTheme(
      //     toolbarTextStyle: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: Dimens.textSizeXLarge,
      //         color: ColorPalette.black),
      //     backgroundColor: ColorPalette.white,
      //     iconTheme: IconThemeData(
      //       color: ColorPalette.black, //change your color here
      //     ),
      //   ),
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(fontSize: Dimens.textSizeLarge),
      //     bodyText2: TextStyle(fontSize: Dimens.textSizeLarge),
      //     button: TextStyle(fontSize: Dimens.textSizeLarge),
      //   ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       primary: ColorPalette.colorPrimary,
      //       onPrimary: ColorPalette.white,
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(Dimens.borderRadiusSmall)),
      //       textStyle: TextStyle(
      //           fontSize: Dimens.textSizeLarge,
      //           fontWeight: FontWeight.normal,
      //           color: ColorPalette.colorPrimary),
      //     ),
      //   ),
      //   outlinedButtonTheme: OutlinedButtonThemeData(
      //     style: OutlinedButton.styleFrom(
      //       backgroundColor: ColorPalette.white,
      //       side: BorderSide(width: 2, color: ColorPalette.colorPrimary),
      //       primary: ColorPalette.colorPrimary,
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(Dimens.borderRadiusSmall)),
      //       textStyle: TextStyle(
      //           fontSize: Dimens.textSizeLarge, fontWeight: FontWeight.normal),
      //     ),
      //   ),
      // ),
      getPages: AppPages.routes,
      initialBinding: GlobalBinding(),
      initialRoute: Routes.LOGIN,
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
EOF