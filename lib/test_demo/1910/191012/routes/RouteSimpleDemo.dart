import 'package:flutter/material.dart';

class RouteSimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RouteSimpleDemo",
      routes: <String, WidgetBuilder>{
        'Screen1': (BuildContext context) => Screen1()
        // 'Screen2': (BuildContext context) => Screen1()
        // 'Screen3': (BuildContext context) => Screen1()
        // 'Screen4': (BuildContext context) => Screen1()
        // 'Screen5': (BuildContext context) => Screen1()
        // 'Screen6': (BuildContext context) => Screen1()
      },
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouteSimpleDemo"),
      ),
      body: Container(
        color: Colors.cyan,
        child: Text("Screen1"),
      ),
    );
  }
}
