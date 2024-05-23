import 'package:codegen/utils/theme/widgets_theme.dart';
import 'package:codegen/utils/theme/widgets_theme/elevated_button_theme.dart';
import 'package:codegen/utils/theme/widgets_theme/outlined_button_theme.dart';
import 'package:codegen/utils/theme/widgets_theme/text_field_theme.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppThemes {

  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextThemes.lightTextTheme,
    outlinedButtonTheme: fOutlinedButtonTheme.LightOutlinedButtonTheme,
    elevatedButtonTheme: fElevatedButtonTheme.LightElevatedButtonTheme,
    inputDecorationTheme: fTextFormFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextThemes.darkTextTheme,
    outlinedButtonTheme: fOutlinedButtonTheme.DarkOutlinedButtonTheme,
    elevatedButtonTheme: fElevatedButtonTheme.DarkElevatedButtonTheme,
    inputDecorationTheme: fTextFormFieldTheme.darkInputDecorationTheme,
  );

}


