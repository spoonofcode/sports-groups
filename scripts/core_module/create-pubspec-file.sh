#!/usr/bin/env bash

# define the template.
cat  << EOF
name: core
description: A new Flutter package project.
version: 0.0.1
homepage:

environment:
  sdk: ">=2.16.1 <3.0.0"
  flutter: ">=1.17.0"

dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  get: ^4.6.1
  get_storage: ^2.0.3
  flutter_secure_storage: ^5.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter.
flutter:

EOF