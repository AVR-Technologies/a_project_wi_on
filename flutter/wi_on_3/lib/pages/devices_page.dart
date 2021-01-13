import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants.dart';
import '../device.dart';
import '../widgets/widgets.dart';
import '../pages/pages.dart';
class DevicesPage extends StatefulWidget{
  @override _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {

  Future<List<Map<String, dynamic>>> devices() async =>
      database.then((value) => value.query('devices'));
  Future<dynamic> clearDevice() async =>
      database.then((value) => value.delete('devices'));

  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('devices'),
      actions: [
        IconButton(
          icon: Icon(Icons.add_rounded),
          onPressed: ()=> AddDevicePage().route().go(context).then((value) => setState((){})),
        ),
      ],
    ),
    body: FutureBuilder(
      future: devices(),
      builder: (context, snapshot) => snapshot.hasData ?
      Let<List<Map<String, dynamic>>>(
        let: snapshot.data,
        builder: (devices) => ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) => Let<Device>(
            let: Device.from(devices[index]),
            builder: (device) => ListTile(
              leading: Icon(Icons.lightbulb_outline_rounded, color: Theme.of(context).primaryColor,),
              title: Text(device.deviceName),
              trailing: Text(device.wifiName),
              onTap: () async {
                Map<Permission, PermissionStatus> statuses = await [Permission.location].request();
                if(statuses[Permission.location] == PermissionStatus.granted){
                  RemotePage(device: device,).route().go(context);
                } else if(statuses[Permission.location] == PermissionStatus.permanentlyDenied){
                  openAppSettings();
                } else {}
              },
            ),
          )
        ),
      ) :
      Center(child: CircularProgressIndicator(),),
    ),
  );
  TextStyle get h5 => Theme.of(context).textTheme.headline5;
}