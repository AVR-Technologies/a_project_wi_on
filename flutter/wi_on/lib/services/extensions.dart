import 'package:flutter/material.dart';

extension BrightnessExtension on Brightness{
  bool isDarkMode() => this == Brightness.dark;
}
extension ContextExtension on BuildContext{
  Brightness brightness() => Theme.of(this).brightness;
  bool isDarkMode() => Theme.of(this).brightness == Brightness.dark;
}
extension WidgetExtension on Widget{
  //padding only for dynamic widgets not for constant like Divider()
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this,);
}