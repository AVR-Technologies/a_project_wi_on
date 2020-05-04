import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wi_on/services/services.dart';
import 'package:wi_on/values/values.dart';

class InputField extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIconData;
  const InputField({this.controller, @required this.labelText, @required this.prefixIconData});
  @override Widget build(BuildContext context) => TextField(
    controller: controller,
    style: GoogleFonts.roboto().copyWith(
      color: chooseLightTextColor(context),
      letterSpacing: 1.2,
    ),
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
  ).paddingAll(8);
}

class ListTileButton extends StatelessWidget{
  final GestureTapCallback onTap;
  final IconData leadingIconData;
  final String titleText;
  const ListTileButton({this.onTap, @required this.leadingIconData, @required this.titleText});
  @override Widget build(BuildContext context) => ListTile(
    leading: Icon(leadingIconData, color: chooseLabelTextColor(context),),
    title: Text(titleText, style: GoogleFonts.roboto().copyWith(color: chooseLabelTextColor(context)),),
    onTap: onTap,
  );
}