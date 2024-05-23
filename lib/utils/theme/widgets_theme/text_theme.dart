
// Light & Dark Themes
import 'package:codegen/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FTextTheme {
  FTextTheme._();

  // Light TextTheme
  static TextTheme lightTextTheme  = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: fDarkColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: fDarkColor),
    displaySmall: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: fDarkColor),
    headlineMedium: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600, color: fDarkColor),
    titleLarge: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.w600, color: fDarkColor),
    bodyLarge: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.normal, color: fDarkColor),
    bodyMedium: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.normal, color: fDarkColor),
  );

  // Dark TextTheme
  static TextTheme darkTextTheme  = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: fWhiteColor),
    displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: fWhiteColor),
    displaySmall: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: fWhiteColor),
    headlineMedium: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600, color: fWhiteColor),
    titleLarge: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.w600, color: fWhiteColor),
    bodyLarge: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.normal, color: fWhiteColor),
    bodyMedium: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.normal, color: fWhiteColor),
  );
}
