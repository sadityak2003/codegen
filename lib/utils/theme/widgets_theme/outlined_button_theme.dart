import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class fOutlinedButtonTheme {
  fOutlinedButtonTheme._();

  // Light Theme
  static final LightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: fSecondaryColor,
      side: const BorderSide(color: fSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: fButtonHeight),
    ),
  );

  // Dark Theme
  static final DarkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: fWhiteColor,
      side: const BorderSide(color: fWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: fButtonHeight),
    ),
  );

}