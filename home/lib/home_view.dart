import 'package:core_ui/colors.dart';
import 'package:core_ui/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(Dimens.paddingLarge),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: Dimens.heightL,
                ),
                const Text(
                  'home',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Dimens.textSizeLarge,
                      color: ColorPalette.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  controller.userName.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Dimens.textSizeLarge,
                      color: ColorPalette.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
