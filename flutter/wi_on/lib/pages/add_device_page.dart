import 'package:flutter/material.dart';
import 'package:wi_on/custom_widgets/custom_widgets.dart';
import 'package:wi_on/values/values.dart';

class AddDevicePage extends StatefulWidget{
  @override _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final deviceNameController = new TextEditingController();
  final deviceWifiNameController = new TextEditingController();
  final deviceWifiPasswordController = new TextEditingController();
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('New Device'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          tooltip: 'Scan QR code',
          icon: Icon(Icons.camera),
        )
      ],
    ),
    body: Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          InputField(
            controller: deviceNameController,
            labelText: 'Device name',
            prefixIconData: Icons.create,
          ),
          InputField(
            controller: deviceWifiNameController,
            labelText: 'Wifi name',
            prefixIconData: Icons.wifi,
          ),
          InputField(
            controller: deviceWifiPasswordController,
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
    ),
  );
  clearAll(){
    deviceNameController.clear();
    deviceWifiNameController.clear();
    deviceWifiPasswordController.clear();
  }
  save() => Navigator.pop(context,Device(
    deviceName: deviceNameController.text,
    deviceWifiName: deviceWifiNameController.text,
    deviceWifiPassword: deviceWifiPasswordController.text,).toMap());
}