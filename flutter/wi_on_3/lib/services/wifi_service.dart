import 'package:flutter/services.dart';

class WifiService {
  List<String> result = ["failed", "success", "exception"];
  static const MethodChannel channel = const MethodChannel("com.settings.plugins/wifi");
  String response = '';
  Future<int> connect({String wifiSSID, String wifiPassword}) async {
    try { return await channel.invokeMethod('connect', {'wifiSSID' : wifiSSID, 'wifiPassword' : wifiPassword,}); }
    on PlatformException catch (_) { return 2; }}
  Future<String> disconnect() async {
    try{ return await channel.invokeMethod('disconnect',{}); }
    on PlatformException catch (_) { return "Failed to perform operation"; } }
  Future<String> status({String of}) async {
    try{ return await channel.invokeMethod('status', {"of" : of}); }
    on PlatformException catch (_) { return 'Failed to perform operation'; } }
  Future<int> isConnectedTo({String ssid}) async {
    try{ return await channel.invokeMethod('isConnectedTo', {"ssid" : ssid}); }
    on PlatformException catch (_) { return 2; }}
}