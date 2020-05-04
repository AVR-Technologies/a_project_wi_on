export 'extensions.dart';
export 'permission_service.dart';
export 'wifi_service.dart';
export 'settings_service.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

getLocationPermission() async => await PermissionHandler().requestPermissions([PermissionGroup.location]);
Future<bool> haveLocationPermission() async => await PermissionHandler().checkPermissionStatus(PermissionGroup.location) == PermissionStatus.granted;
goTo(context, page) => Navigator.push(context, MaterialPageRoute(builder: (context) => page,),);
goBack(context) => Navigator.pop(context);
goBackWith(context, result) => Navigator.pop(context, result);

