#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:core_ui/colors.dart';
import 'package:core_ui/dimens.dart';
import 'package:flutter/material.dart';

class ExampleLogo extends StatelessWidget {
  const ExampleLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.paddingSmall),
      child: Image.asset(
        'core_ui/assets/images/example_logo.png',
        color: ColorPalette.colorPrimary,
      ),
    );
  }
}
EOF