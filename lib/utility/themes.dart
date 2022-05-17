import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  tabBarTheme: const TabBarTheme(labelColor: Colors.black),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black),
    ),
  ),
  textTheme: GoogleFonts.nunitoSansTextTheme(),
);
