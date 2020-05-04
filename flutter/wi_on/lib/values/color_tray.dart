import 'package:flutter/material.dart';
import 'package:wi_on/services/services.dart';
import 'package:wi_on/values/values.dart';
class ColorTray {
  Color getPrimaryColor(int index) => ColorTray().getColorsFromIndex(index).primaryColor;
  List<ColorIndex> colorTray = [
    ColorIndex(Colors.red[600],         Colors.red[300],        'Red',          00) ,
    ColorIndex(Colors.pink[600],        Colors.pink[300],       'Pink',         01) ,
    ColorIndex(Colors.purple[600],      Colors.purple[300],     'Purple',       02) ,
    ColorIndex(Colors.deepPurple[600],  Colors.deepPurple[200], 'Deep purple',  03) ,
    ColorIndex(Colors.indigo[600],      Colors.indigo[200],     'Indigo',       04) ,
    ColorIndex(Colors.blue[600],        Colors.blue[200],       'Blue',         05) ,
    ColorIndex(Colors.lightBlue[600],   Colors.lightBlue[300],  'Light blue',   06) ,
    ColorIndex(Colors.cyan[800],        Colors.cyan[300],       'Cyan',         07) ,
    ColorIndex(Colors.teal[700],        Colors.teal[300],       'Teal',         08) ,
    ColorIndex(Colors.green[600],       Colors.green[300],      'Green',        09) ,
    ColorIndex(Colors.lightGreen[800],  Colors.lightGreen[300], 'Light green',  10) ,
    ColorIndex(Colors.lime[800],        Colors.lime[300],       'Lime',         11) ,
    ColorIndex(Colors.yellow[700],      Colors.yellow[300],     'Yellow',       12) ,
    ColorIndex(Colors.amber[800],       Colors.amber[300],      'Amber',        13) ,
    ColorIndex(Colors.orange[800],      Colors.orange[300],     'Orange',       14) ,
    ColorIndex(Colors.deepOrange[800],  Colors.deepOrange[300], 'Deep orange',  15) ,
    ColorIndex(Colors.brown[600],       Colors.brown[400],      'Brown',        16) ,
    ColorIndex(Colors.grey[700],        Colors.grey[300],       'Grey',         17) ,
    ColorIndex(Colors.blueGrey[700],    Colors.blueGrey[300],   'Blue grey',    18) ,
  ];
  ColorIndex getColorsFromIndex(int index) => index <= 18 && index >= 0 ? colorTray[index] : colorTray[5];
  Color getPrimaryColorLight(int index) => ColorTray().getColorsFromIndex(index).primaryColorLight;
  Color getAccentColor(int index, Brightness brightness) => ColorTray().getColorsFromIndex(index).let((it) => brightness.isDarkMode() ? it.primaryColorLight : it.primaryColor) ;
  Color getInvertedAccentColor(int index, Brightness brightness) => ColorTray().getColorsFromIndex(index).let((it) => !brightness.isDarkMode() ? it.primaryColorLight : it.primaryColor);
  Color getScaffoldColor(Brightness brightness) => brightness.isDarkMode() ? Colors.grey[900] : Colors.white;
  Color getInvertedScaffoldColor(Brightness brightness) => !brightness.isDarkMode() ? Colors.grey[900] : Colors.white;

}


Color chooseLightTextColor(context) =>
    Theme.of(context).brightness.isDarkMode() ? Colors.white : Colors.grey[800] ;

Color chooseInvertedLightTextColor(context) =>
    !Theme.of(context).brightness.isDarkMode() ? Colors.white : Colors.grey[800] ;

Color chooseLabelTextColor(context) =>
    Theme.of(context).brightness.isDarkMode() ? Theme.of(context).primaryColorLight: Theme.of(context).primaryColor;

