import 'package:google_fonts/google_fonts.dart';
import 'package:wi_on/values/values.dart';
import 'services.dart';
import 'package:flutter/material.dart';
ThemeData getTheme(Brightness brightness, int index)=>
    (brightness.isDarkMode() ? ThemeData.dark() : ThemeData.light()).copyWith(
    primaryColor: ColorTray().getPrimaryColor(index),
    primaryColorLight: ColorTray().getPrimaryColorLight(index),
    accentColor: ColorTray().getAccentColor(index, brightness),
    toggleableActiveColor: ColorTray().getPrimaryColor(index),
    brightness: brightness,
    scaffoldBackgroundColor: ColorTray().getScaffoldColor(brightness),
    textTheme: GoogleFonts.montserratTextTheme(),
    cardTheme: CardTheme( 
      color: ColorTray().getScaffoldColor(brightness),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: GoogleFonts.raleway().copyWith(
        fontSize: 20,
        color: ColorTray().getInvertedScaffoldColor(brightness)
      )
    ),
    appBarTheme: AppBarTheme(
      color: ColorTray().getScaffoldColor(brightness),
      textTheme: GoogleFonts.montserratTextTheme().copyWith(
        title: GoogleFonts.montserrat().copyWith(
          fontSize: 20,
          color: ColorTray().getAccentColor(index, brightness),
          fontWeight: FontWeight.bold,
          letterSpacing: 1.8,
        ),
      ),
      iconTheme: IconThemeData( color: ColorTray().getAccentColor(index, brightness),),
    ),
);