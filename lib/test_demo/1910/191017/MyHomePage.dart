import 'package:flutter/material.dart';
import 'package:flutter_demo/test_demo/1910/191017/MyAppPage.dart';

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
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转到下一个页面"),
      color: Colors.teal,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MyAppPage(),
            ));
      },
    );
  }
}

//TODO
