import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/pages.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  database = openDatabase(join(await getDatabasesPath(), 'db_devices.db'),
  onCreate: (db, _) => db.execute(
  "CREATE TABLE devices(id INTEGER PRIMARY KEY, deviceName TEXT, wifiName TEXT, wifiPassword TEXT)"),
  version: 1);
  // using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      accentColor: Colors.red,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
        brightness: Theme.of(context).brightness,
        color: Colors.white,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        textTheme: GoogleFonts.kanitTextTheme(Theme.of(context).textTheme.copyWith(
          title: Theme.of(context).textTheme.headline5
        ))
      ),
      primaryColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: DevicesPage(),
  );
}
