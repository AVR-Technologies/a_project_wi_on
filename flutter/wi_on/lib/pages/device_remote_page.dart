import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wi_on/services/services.dart';
import 'package:wi_on/values/values.dart';

class DeviceRemotePage extends StatefulWidget{
  final Device device;
  const DeviceRemotePage({Key key, this.device}) : super(key: key);
  @override _DeviceRemotePageState createState() => _DeviceRemotePageState();
}

class _DeviceRemotePageState extends State<DeviceRemotePage> {
  bool isTurnedOn;
  @override Widget build(BuildContext context) => widget.device.let((it) => Scaffold(
    appBar: AppBar(
      title: Text(it.deviceName),
      centerTitle: true,
    ),
    body: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.lightbulb_outline),
          title: Text(it.deviceWifiName, style: GoogleFonts.montserrat().copyWith(color: chooseLightTextColor(context)),),
          trailing: Icon(Icons.wifi, color: Colors.green[400]),
        ),
        Spacer(flex: 3,),
        MaterialButton(
          height: 160,
          minWidth: 160,
          onPressed: ()=> setState(() => isTurnedOn = true),
          child: Icon(Icons.flash_on, size: 60, color: Colors.green[700],),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
            side: BorderSide(
              width: 4,
              color: Colors.green[400],
            ),
          ),
          splashColor: Colors.green[400],
          color: isTurnedOn != null && isTurnedOn ? Colors.green[400] : null,
        ),
        Spacer(flex: 1,),
        MaterialButton(
          height: 160,
          minWidth: 160,
          onPressed: ()=> setState(() => isTurnedOn = false),
          child: Icon(Icons.flash_off, size: 60, color: Colors.red[800],),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
            side: BorderSide(
                width: 4,
                color: Colors.red[400]
            ),
          ),
          splashColor: Colors.red[400],
          color: isTurnedOn != null && !isTurnedOn ? Colors.red[400] : null,
        ),
        Spacer(flex: 3,),
      ],
    ),
  ),);
}