import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wi_on_3/values/strings.dart';
import 'package:http/http.dart' as http;

extension IntExtensions on int {
  bool isPositive() => this >= 0;
  bool isNegative() => !isPositive();
  bool isZero()     => this == 0;
  bool isNotZero()  => !isZero();
//  bool equals(num) => this == num;
//  bool notEquals(num) => this != num;
}
extension numExtension on num {
  double mapInRange({num inMin= 0, num inMax = 100, num outMin= 0, num outMax= 10}) =>
      (this - inMin)*(outMax - outMin)/(inMax - inMin) + outMin;
}
extension ObjectExtensions on Object {
  bool isNull()    => this == null ? true : false;
  bool isNotNull() => !isNull();
  String withNullSafeArray() => this ?? Strings.null_json_array;
  String toJson() => json.encode(this);
  void also(void callBack(String result)) => this;
  bool equals(val) => this == val;
  bool notEquals(val) => !equals(val);
}
extension MapExtensions on List<Map<String,String>>{
  String toJsonString() => json.encode(this);
}
extension StringExtension on String {
  String withNullSafeArray() => this ?? Strings.null_json_array;
  bool isBlank() => this == "";
  bool isNotBlank() => !isBlank();
  Object decodeJson() => json.decode(this);
  ping() => http.get(this);
  int toInt() => int.parse(this);
}
extension FutureExtensions<T> on Future<T>{
  Stream get stream => Stream.fromFuture(this);
}
extension WidgetExtension on Widget{
  Widget paddingAll(double padding) => Padding(
    padding: EdgeInsets.all(padding),
    child: this,);
  Widget paddingOnly({double top = 0, double bottom = 0, double right = 0, double left = 0}) => Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom, right: right, left: left),
    child: this,);
  Widget paddingHorizontal(double padding) => Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this,);
  Widget paddingVertical(double padding) => Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this,);
  Widget createSnackBar() => SnackBar(content: this, duration: Duration(seconds: 1),);
  Widget size({double size}) => SizedBox(width: size, height: size, child: this,);
}