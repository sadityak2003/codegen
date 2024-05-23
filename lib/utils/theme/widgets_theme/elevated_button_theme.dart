import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class fElevatedButtonTheme {
  fElevatedButtonTheme._();

  // Light Theme
static final LightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: const RoundedRectangleBorder(),
    foregroundColor: fWhiteColor,
    backgroundColor: fSecondaryColor,
    side: const BorderSide(color: fSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: fButtonHeight),
  ),
);

  // Dark Theme
static final DarkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: const RoundedRectangleBorder(),
    foregroundColor: fSecondaryColor,
    backgroundColor: fWhiteColor,
    side: const BorderSide(color: fSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: fButtonHeight),
  ),
);

}