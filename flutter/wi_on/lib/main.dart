import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wi_on/services/custom_theme.dart';
import 'pages/devices_page.dart';
import 'values/values.dart';
import 'services/services.dart';
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override Widget build(BuildContext context) => MaterialApp(
    title: Strings.app_name,
    debugShowCheckedModeBanner: false,
    theme: getTheme(Brightness.light, 4),
    home: DevicesPage(),
  );
}
