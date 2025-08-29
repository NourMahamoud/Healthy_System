import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        titleMedium: TextStyle(color: Colors.black,fontSize: 50,fontFamily: 'Barbariska'),
        bodySmall: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Akshar',) ,
        titleLarge:TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,) ,
        labelLarge: TextStyle(color: Colors.black,fontSize: 13) ,
        labelSmall: TextStyle(color: Colors.black,fontSize: 15) ,
      ) ,
      iconTheme: IconThemeData(color: App_Colors.generalColor) ,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: App_Colors.generalColor
        ) ,
      ) ,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: App_Colors.generalColor,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
      )
  );
  final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: App_Colors.generalColor,
        elevation: 5,
        type: BottomNavigationBarType.shifting,
      ) ,
      scaffoldBackgroundColor: Colors.black ,
      textTheme: TextTheme(
        titleMedium: TextStyle(color: Colors.white,fontSize: 50,fontFamily: 'Barbariska'),
        bodySmall: GoogleFonts.akshar(color: Colors.white,fontSize: 15,)  ,
        titleLarge:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,) ,
        labelLarge: TextStyle(color: Colors.white,fontSize: 13) ,
        labelSmall: TextStyle(color: Colors.white,fontSize:15 ) ,

      ) ,
      iconTheme: IconThemeData(color: App_Colors.generalColor) ,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: App_Colors.generalColor
        ) ,
      )
  ) ;

}