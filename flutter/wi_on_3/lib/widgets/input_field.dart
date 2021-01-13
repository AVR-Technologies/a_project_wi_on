import 'package:flutter/material.dart';
import 'widgets.dart';
class InputField extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIconData;
  const InputField({this.controller, @required this.labelText, @required this.prefixIconData});
  @override Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIconData),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ).paddingAll(8.0.edgeInsetsAll);
}