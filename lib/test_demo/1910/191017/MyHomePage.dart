import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 路由 Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 路由 Demo"),
        ),
        body: RaisedButton(
          child: Text("跳转到下一个页面"),
        ),
      ),
    );
  }
}

//TODO 
