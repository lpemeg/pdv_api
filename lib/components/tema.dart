import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData temaClaro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blue.shade300,
  ),
  fontFamily: GoogleFonts.openSans().fontFamily,
  textTheme: GoogleFonts.openSansTextTheme(),
);

final ThemeData temaEscuro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.blue.shade900,
  cardColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.blue.shade900,
    secondary: Colors.blue.shade600,
  ),
  fontFamily: GoogleFonts.openSans().fontFamily,
  textTheme: textTheme,
);

final TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.openSans(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: GoogleFonts.openSans(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.openSans(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
  headlineLarge: GoogleFonts.openSans(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineMedium: GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleLarge: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  bodySmall: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  labelLarge: GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  ),
  labelMedium: GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.75,
  ),
  labelSmall: GoogleFonts.openSans(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
