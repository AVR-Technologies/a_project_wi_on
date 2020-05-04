import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wi_on/pages/pages.dart';
import 'package:wi_on/values/values.dart';
import 'package:wi_on/services/services.dart';
class DevicesPage extends StatefulWidget{
  @override _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  List<Device> deviceList = new List();
  @override void initState() {
    setState(() {
      deviceList.add((Device(deviceName: 'Bulb', deviceWifiName: 'AVR_Tube')));
      deviceList.add((Device(deviceName: 'Tube', deviceWifiName: 'AVR_Tube2')));
      deviceList.add((Device(deviceName: 'Fan',  deviceWifiName: 'AVR_Tube3')));
      deviceList.add((Device(deviceName: 'Fan',  deviceWifiName: 'AVR_Tube4')));
    });
    super.initState();
  }
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(Strings.app_name),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          tooltip: 'Add',
          onPressed: goToAddDevicePage,
        ),
        IconButton(
          icon: Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: goToSettingsPage,
        ),
      ],
    ),
    body: Center(
      child: Container(
        width:  MediaQuery.of(context).size.width >= 600 ? 600 :  MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: deviceList.length,
          itemBuilder: deviceItem,
        ),
      ),
    ),
  );
  Widget deviceItem(BuildContext context, int index) => deviceList[index].let((it) => ListTile(
    leading: CircleAvatar(child: Icon(Icons.device_hub), backgroundColor: chooseLabelTextColor(context), foregroundColor: chooseInvertedLightTextColor(context),),
    onTap: () => goToDeviceRemotePage(it),
    onLongPress: () => goToEditDevicePage(index),
    title: Text(it.deviceName ?? '',
      style: GoogleFonts.nunito().copyWith(
        letterSpacing: 1.2,
        fontSize: 19,
        color: chooseLightTextColor(context),
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          it.deviceWifiName ?? '',
          style: GoogleFonts.roboto().copyWith(
            letterSpacing: 1,
            color: chooseLightTextColor(context),
          ),
        ),
        Icon(Icons.keyboard_arrow_right)
      ],
    ),
  ));
  goToAddDevicePage() => Navigator.push(context, MaterialPageRoute(builder: (context) => AddDevicePage())).then((result){
    if(result != null) setState(() => deviceList.add(Device.fromMap(result)));});
  goToDeviceRemotePage(Device device)
  => Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceRemotePage(device: device),),);
  goToEditDevicePage(int index)
  => Navigator.push(context, MaterialPageRoute(builder: (context) => EditDevicePage(device: deviceList[index]),),).then((result) {
    if(result != null) setState(() => deviceList[index] = Device.fromMap(result));
  });
  goToSettingsPage() => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
}