#!/usr/bin/env bash

# define the template.
cat  << EOF
class Dimens {
  static const textSizeSmall = 10.0;
  static const textSizeMedium = 16.0;
  static const textSizeLarge = 18.0;
  static const textSizeXLarge = 24.0;
  static const textSizeXXLarge = 28.0;

  static const paddingXSmall = 6.0;
  static const paddingSmall = 8.0;
  static const paddingMedium = 12.0;
  static const paddingLarge = 16.0;
  static const paddingXLarge = 22.0;
  static const paddingXXLarge = 32.0;
  static const paddingXXXLarge = 60.0;

  static const marginLarge = 16.0;

  // Sized Box
  static const heightSmall = 16.0;
  static const heightL = 60.0;
  static const heightXL = 80.0;
  static const heightXXL = 108.0;

  // Border radius
  static const borderRadiusSmall = 10.0;
  static const borderRadiusMedium = 20.0;

  // Divider line
  static const dividerHeight = 16.0;
  static const dividerThickness = 2.0;

  // Button icons
  static const iconSizeLarge = 24.0;
  static const iconSizeXXLarge = 42.0;
}
EOF