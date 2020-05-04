import 'package:flutter/material.dart';
class ColorIndex {
  Color primaryColor;
  Color primaryColorLight;
  String colorName;
  int colorIndex;
  ColorIndex(this.primaryColor, this.primaryColorLight, this.colorName, this.colorIndex);
  toMap() => {
    'primaryColor'      : this.primaryColor,
    'primaryColorLight' : this.primaryColorLight,
    'colorName'         : this.colorName,
    'colorIndex'        : this.colorIndex,
  };
  ColorIndex.fromDynamic(dynamic map) :
        this.primaryColor       = map['primaryColor'],
        this.primaryColorLight  = map['primaryColorLight'],
        this.colorName          = map['colorName'],
        this.colorIndex         = map['colorIndex'];
  ColorIndex.fromMap(Map<String, dynamic> map) :
        this.primaryColor       = map['primaryColor'],
        this.primaryColorLight  = map['primaryColorLight'],
        this.colorName          = map['colorName'],
        this.colorIndex         = map['colorIndex'];
}