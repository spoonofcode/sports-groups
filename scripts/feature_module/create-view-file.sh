#!/usr/bin/env bash

# define parameters which are passed in.
NAME=$1
NAME_UPPER_CAMEL_CASE="$(echo "$NAME" | perl -pe 's/(?:^|[^a-z])([a-z0-9])/\u$1/g')"
NAME_CAMEL_CASE="$(tr '[:upper:]' '[:lower:]' <<< "${NAME_UPPER_CAMEL_CASE:0:1}")${NAME_UPPER_CAMEL_CASE:1}"

# define the template.
cat  << EOF
import 'package:core_ui/colors.dart';
import 'package:core_ui/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '${NAME}_controller.dart';

class ${NAME_UPPER_CAMEL_CASE}View extends GetView<${NAME_UPPER_CAMEL_CASE}Controller> {
  const ${NAME_UPPER_CAMEL_CASE}View({Key? key}) : super(key: key);

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
                  '${NAME}',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: Dimens.textSizeLarge,
                      color: ColorPalette.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  controller.exampleText.value,
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
EOF

