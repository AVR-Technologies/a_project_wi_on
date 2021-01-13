import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget{
  final GestureTapCallback onTap;
  final IconData leadingIconData;
  final String titleText;
  const ListTileButton({this.onTap, @required this.leadingIconData, @required this.titleText});
  @override Widget build(BuildContext context) => ListTile(
    leading: Icon(leadingIconData, color: Colors.grey[700],),
    title: Text(titleText,),
    onTap: onTap,
  );
}