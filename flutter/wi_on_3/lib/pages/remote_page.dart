import 'package:flutter/material.dart';
import 'package:wi_on_3/device.dart';
import '../widgets/widgets.dart';
import 'package:http/http.dart' as http;

class RemotePage extends StatefulWidget{
  final Device device;
  const RemotePage({Key key, this.device}) : super(key: key);
  @override _RemotePageState createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {
  @override void initState() {
    super.initState();
    print(widget.device.toMap());
  }

  @override Widget build(BuildContext context) =>
      FutureBuilder(
        future: Future.value(0),
          builder: (context, snapshot) => snapshot.hasData ?
          Scaffold(
            appBar: AppBar(
              title: Text(widget.device.deviceName),
            ),
            body: Center(
              child: FlatButton(
                shape: CircleBorder(),
                color: Colors.blue[100],
                textColor: Colors.blue,
                padding: 30.0.edgeInsetsAll,
                child: Icon(Icons.lightbulb_outline_rounded, size: 200,),
                onPressed: () => http.get('http://192.168.0.16/4/chng'),
              ),
            ),) :
          Center(child: CircularProgressIndicator(),)
      );
}