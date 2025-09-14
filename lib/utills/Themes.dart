import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontFamily: 'Barbariska',
      ),
      bodySmall: GoogleFonts.akshar(color: Colors.black, fontSize: 15),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'Barbariska',
      ),
      labelLarge: const TextStyle(color: Colors.black, fontSize: 13),
      labelSmall: const TextStyle(color: Colors.black, fontSize: 15),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: App_Colors.generalColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    iconTheme: IconThemeData(color: App_Colors.generalColor),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: App_Colors.generalColor,
      unselectedItemColor: Colors.black54,
      elevation: 4,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: 'Barbariska',
      ),
      bodySmall: GoogleFonts.akshar(color: Colors.white, fontSize: 15),
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'Barbariska',
        fontWeight: FontWeight.bold,
      ),
      labelLarge: const TextStyle(color: Colors.white, fontSize: 13),
      labelSmall: const TextStyle(color: Colors.white, fontSize: 15),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: App_Colors.generalColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    iconTheme: IconThemeData(color: App_Colors.generalColor),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: App_Colors.generalColor,
      unselectedItemColor: Colors.white70,
      elevation: 4,
      type: BottomNavigationBarType.fixed,
    ),
  );
}