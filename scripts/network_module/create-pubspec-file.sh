#!/usr/bin/env bash

# define the template.
cat  << EOF
name: network
description: A new Flutter package project.
version: 0.0.1
homepage:

environment:
  sdk: ">=2.16.1 <3.0.0"
  flutter: ">=1.17.0"

dependencies:
  flutter:
    sdk: flutter

  # Modules
  core:
    path: ../core

  dio: ^4.0.4
  json_serializable: ^6.1.3
  equatable: ^2.0.3
  retrofit: ^3.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0
  build_runner: ^2.1.7
  retrofit_generator: ^3.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter.
flutter:

EOF