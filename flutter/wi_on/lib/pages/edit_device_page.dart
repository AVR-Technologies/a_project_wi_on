import 'package:flutter/material.dart';
import 'package:wi_on/custom_widgets/custom_widgets.dart';
import 'package:wi_on/services/services.dart';
import 'package:wi_on/values/device.dart';

class EditDevicePage extends StatefulWidget{
  final Device device;
  EditDevicePage({this.device});
  @override _EditDevicePageState createState() => _EditDevicePageState();
}

class _EditDevicePageState extends State<EditDevicePage> {
  final deviceNameController = new TextEditingController();
  final deviceWifiNameController = new TextEditingController();
  final deviceWifiPasswordController = new TextEditingController();
  @override void initState() {
    reset();
    super.initState();
  }
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edit Device'),
      centerTitle: true,
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
            leadingIconData: Icons.refresh,
            onTap: reset,
            titleText: 'Reset',
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
  reset() => widget.device.let((it) => setState(() {
    deviceNameController.text         = it.deviceName;
    deviceWifiNameController.text     = it.deviceWifiName;
    deviceWifiPasswordController.text = it.deviceWifiPassword;
  }));
  save() => Navigator.pop(context, Device(
    deviceName: deviceNameController.text,
    deviceWifiName: deviceWifiNameController.text,
    deviceWifiPassword: deviceWifiPasswordController.text,).toMap()
  );
}