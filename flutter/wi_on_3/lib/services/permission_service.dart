import 'package:flutter/services.dart';

class PermissionService {
  static const MethodChannel channel = const MethodChannel("com.settings.plugins/permissions");
  Future<void> request({List<String> permissions}) async {
    try{ channel.invokeMethod("request", permissions);}
    on PlatformException catch(_){ print(_);}
  }

}
class Permissions {
  static const String AccessWifi = "AccessWifi";
  static const String ChangeWifi = "ChangeWifi";
  static const String FineLocation = "FineLocation";
  static const String CoarseLocation = "CoarseLocation";
}