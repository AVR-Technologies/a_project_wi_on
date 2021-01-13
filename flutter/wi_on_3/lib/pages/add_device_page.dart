import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wi_on_3/constants.dart';
import '../device.dart';
import '../widgets/widgets.dart';
class AddDevicePage extends StatefulWidget{
  @override _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final deviceNameController = new TextEditingController();
  final wifiNameController = new TextEditingController();
  final wifiPasswordController = new TextEditingController();
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('new device'),
      centerTitle: true,
      actions: <Widget>[
        // IconButton(
        //   onPressed: (){},
        //   tooltip: 'scan QR code',
        //   icon: Icon(Icons.qr_code_rounded),
        // ),
      ],
    ),
    body: ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        InputField(
          controller: deviceNameController,
          labelText: 'Device name',
          prefixIconData: Icons.create,
        ),
        InputField(
          controller: wifiNameController,
          labelText: 'Wifi name',
          prefixIconData: Icons.wifi,
        ),
        InputField(
          controller: wifiPasswordController,
          labelText: 'Wifi password',
          prefixIconData: Icons.vpn_key,
        ),
        ListTileButton(
          leadingIconData: Icons.clear_all,
          onTap: clearAll,
          titleText: 'Clear all',
        ),
        ListTileButton(
          leadingIconData: Icons.save,
          titleText: 'Save',
          onTap: save,
        ),
      ],
    ),
  );
  clearAll(){
    deviceNameController.clear();
    wifiNameController.clear();
    wifiPasswordController.clear();
  }
  // save() => Navigator.pop(context,Device(
  //   deviceName: deviceNameController.text,
  //   wifiName: wifiNameController.text,
  //   wifiPassword: wifiPasswordController.text,).toMap());
  save(){
    if(deviceNameController.text.isNotEmpty && wifiNameController.text.isNotEmpty)
      database.then((value) => value.insert('devices',
          Device(
            deviceName: deviceNameController.text.toString(),
            wifiName: wifiNameController.text.toString(),
            wifiPassword: wifiPasswordController.text.toString(),).toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace)).then((value) => Navigator.pop(context),);
  }
}