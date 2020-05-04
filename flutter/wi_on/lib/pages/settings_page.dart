import 'package:flutter/material.dart';
import 'package:wi_on/values/settings.dart';
import 'package:wi_on/values/values.dart';

class SettingsPage extends StatefulWidget{
  @override _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Settings settings = new Settings();
  @override Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
      title: Text('Settings'),
    ),
    body: ListView(
      children: <Widget>[
        ListTile(
          title: Text('Theme Settings', style: TextStyle(color: chooseLabelTextColor(context),),),
        ),
        SwitchListTile(
          secondary: Icon(Icons.brightness_6),
          title: Text('Dark Mode', style: TextStyle(color: chooseLightTextColor(context),),),
          value: settings.darkMode,
          onChanged: (value)=> setState(() => settings.darkMode = !settings.darkMode),
        ),
//        ListTile(
//          leading: Icon(Icons.color_lens),
//          title: Text('Red', style: TextStyle(color: chooseLightTextColor(context),),),
//          trailing: CircleAvatar(foregroundColor: Theme.of(context).primaryColor,),
//          onTap: chooseColor,
//        ),
        ListTile(
          title: Text('Remote Settings', style: TextStyle(color: chooseLabelTextColor(context),),),
        ),
        SwitchListTile(
          secondary: Icon(Icons.vibration),
          title: Text('Shake detector', style: TextStyle(color: chooseLightTextColor(context),),),
          subtitle: !settings.shakeDetectorEnable ? null : Text(settings.shakeIntensity.toString(), style: TextStyle(color: chooseLightTextColor(context),),),
          value: settings.shakeDetectorEnable,
          onChanged: (value) => setState(() => settings.shakeDetectorEnable = !settings.shakeDetectorEnable),
        ),
        Visibility(
          visible: settings.shakeDetectorEnable,
          child: Slider(
            value: settings.shakeIntensity.toDouble(),
            max: 100,
            activeColor: Theme.of(context).primaryColor,
            min: 0,
            onChanged: (value) => setState(() => settings.shakeIntensity = value.toInt()),
          ),
        ),
        SwitchListTile(
          secondary: Icon(Icons.av_timer),
          title: Text('Time out', style: TextStyle(color: chooseLightTextColor(context),),),
          subtitle: !settings.timeOutEnable ? null : Text(settings.timeOutDelay.toString(), style: TextStyle(color: chooseLightTextColor(context),),),
          value: settings.timeOutEnable,
          onChanged: (value) => setState(() => settings.timeOutEnable = !settings.timeOutEnable),
        ),
        Visibility(
          visible: settings.timeOutEnable,
          child: Slider(
            value: settings.timeOutDelay.toDouble(),
            max: 100,
            activeColor: Theme.of(context).primaryColor,
            min: 0,
            onChanged: (value) => setState(() => settings.timeOutDelay = value.toInt()),
          ),
        ),



      ],
    ),
  );
  chooseColor()=> showDialog(context: context, builder: (context) => Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('choose'),
        ListView.builder(
          itemCount: ColorTray().colorTray.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(ColorTray().colorTray[index].colorName),
          ),
        ),
        FlatButton(
          child: Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  ));
}