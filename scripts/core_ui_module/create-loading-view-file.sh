#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:core_ui/colors.dart';
import 'package:core_ui/dimens.dart';
import 'package:core_ui/widget/logo/example_logo.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: Dimens.heightXXL),
          ExampleLogo(),
          SizedBox(height: Dimens.heightXXL),
          SizedBox(
            height: Dimens.heightXL,
            width: Dimens.heightXL,
            child: CircularProgressIndicator(
                color: ColorPalette.colorPrimary, strokeWidth: 8.0),
          ),
        ],
      ),
    );
  }
}
EOF