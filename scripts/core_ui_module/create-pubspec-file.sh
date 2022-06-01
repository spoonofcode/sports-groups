#!/usr/bin/env bash

# define the template.
cat  << EOF
name: core_ui
description: A new Flutter package project.
version: 0.0.1
homepage:

environment:
  sdk: ">=2.16.2 <3.0.0"
  flutter: ">=1.17.0"

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter.
flutter:
  uses-material-design: true
  assets:
    - assets/images/example_logo.png
EOF