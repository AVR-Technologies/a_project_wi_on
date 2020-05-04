import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:wi_on_3/pages/list_devices/device.dart';
import 'package:wi_on_3/pages/pages.dart';
import 'package:wi_on_3/services/services.dart';
import 'package:wi_on_3/values/values.dart';

class RemotePage extends StatefulWidget{
  final Device device;
  RemotePage({Key key, this.device}) : super(key: key);
  @override _RemotePageState createState() => _RemotePageState();
}
class _RemotePageState extends State<RemotePage> {
  int connected = 3;
  Timer wifiConnectionTimer;
  Timer uiTimer;
  int uiCounter = 0;
  ShakeDetector shakeDetector;
  SettingsService settingsService = new SettingsService();

  @override void initState() {
    super.initState();
    init();
  }
  @override void dispose() {
    exit();
    super.dispose();
  }
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text( widget.device.name),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          title: Text(widget.device.wifiSSID),
          leading: Icon(Icons.device_hub),
          trailing:
          connected.equals(1) ? Icon(Icons.wifi, color: Colors.green[800],) :
          connected.equals(0) ? Icon(Icons.signal_wifi_off, color: Colors.red[800],) :
          connected.equals(3) ? CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),).size(size: 20) :
          Icon(Icons.error, color: Colors.grey[600],),),
        Spacer(),
        Center(child: Icon(Icons.lightbulb_outline, size: 160, color: Colors.grey[300],),),
        Spacer(),
        FlatButton.icon(
          onPressed: turnOnDevice,
          icon: Icon(Icons.flash_on),
          label: Text('Turn on'),
          padding: EdgeInsets.all(10),
          color: Colors.green[400],
          textColor: Colors.white,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(30),),),).paddingHorizontal(5),
        FlatButton.icon(
          onPressed: turnOffDevice,
          icon: Icon(Icons.flash_off),
          label: Text('Turn off'),
          padding: EdgeInsets.all(10),
          color: Colors.red[400],
          textColor: Colors.white,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(30),),),).paddingHorizontal(5),
      ],
    ),
  );

  //http calls
  turnOnDevice() {
    Strings.turn_on_url.ping();
    initUICounter();
  }
  turnOffDevice() {
    Strings.turn_off_url.ping();
    initUICounter();
  }
  changeStatusOfDevice() {
    Strings.change_status_url.ping();
    initUICounter();
  }

  //wifi connections
  connect() => WifiService().connect(wifiSSID: widget.device.wifiSSID, wifiPassword: widget.device.wifiPassword);
  checkConnection() => wifiConnectionTimer = Timer.periodic(Duration(seconds: 1),(_) async =>
      WifiService().isConnectedTo(ssid: widget.device.wifiSSID).then((int _connected) =>
          setState(() => connected = _connected,),)
          .then((_) => connected.notEquals(1) ? connect() : print(connected),),);

  //user interface monitoring
  checkUI() => settingsService.ready.then((bool ready){
    if (ready && settingsService.settings.timeOut) uiTimer = Timer.periodic(Duration(seconds: 1), (timer){
      if(uiCounter >= settingsService.settings.timeOutDelay){ exit(); goBack(context);}
      print(uiCounter);
      uiCounter++;
    });});
  initUICounter() => setState(() => uiCounter = 0);

  //page init exit routine
  exit(){
    if(wifiConnectionTimer != null) wifiConnectionTimer.cancel();
    if(uiTimer != null) uiTimer.cancel();
    if(settingsService.settings.shake) shakeDetector.stopListening();
    WifiService().disconnect();
  }
  init(){
    connect();
    checkConnection();
    checkUI();
    settingsService.ready.then((ready){ if (ready && settingsService.settings.shake)
      shakeDetector = ShakeDetector.autoStart( onPhoneShake: () => changeStatusOfDevice(), shakeThresholdGravity: settingsService.settings.shakeSensitivity );
    });
  }

  goToSettings() => goTo(context, SettingsPage());
}