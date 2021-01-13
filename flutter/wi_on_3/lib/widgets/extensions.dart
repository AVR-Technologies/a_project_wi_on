import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {

  SizedBox inSizedBox(Size size) => SizedBox.fromSize(
    child: this,
    size: size,
  );

  Padding paddingAll(EdgeInsetsGeometry padding) => Padding(
    padding: padding,
    child: this,
  );

  ListTile tile({bool dense = false}) => ListTile(
    title: this,
    dense: dense,
  );

  Positioned positioned(
      {double right, double left, double top, double bottom}) =>
      Positioned(
        child: this,
        right: right,
        left: left,
        top: top,
        bottom: bottom,
      );
  Route route() => MaterialPageRoute(builder: (context) => this);
}
extension w_doubleExtensions on double {
  Radius get radius => Radius.circular(this);

  BorderRadius get borderRadius => BorderRadius.circular(this);

  Size get squareSize => Size.square(this);

  EdgeInsetsGeometry get edgeInsetsAll => EdgeInsets.all(this);
}
extension RouteExtensions on Route {
  // Future<T> go() => navigator.push(this); //not working
  Future go(BuildContext context) => Navigator.push(context, this);
}