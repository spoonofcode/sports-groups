#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'dart:ui';

class ColorPalette {
  static const Color colorPrimary = Color(0xff434479);
  static const Color colorPrimaryDark = Color(0xff1e1a18);

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color red = Color(0xff830000);
  static const Color gray = Color(0xffaaaaaa);
}
EOF