import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/common_utils.dart';
import 'package:flutter_demo/test_demo/1909/190930/ExpandedDemo.dart';
import 'package:flutter_demo/test_demo/1909/190930/SimpleDemo.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MaterailStyleApp());
}

class MaterailStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.amberAccent[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: BuildWidget.buildBodyWidget(),
      ),
    );
  }
}

class BuildWidget {
  static Widget buildBodyWidget() {
    
    var isTest = true;

    if (isTest) return SimpleDemo();

    var dateTime = DateTime.now().toString().split(" ")[0];
    Log.d(" 打印当前时间 ： " + DateTime.now().toString(), tag: "BuildWidget");
    switch (dateTime) {
      case "2019-09-30":
        return ExpandedDemo();
      default:
        return BuildWidget._instance()._createDefault();
    }
  }

  static BuildWidget _instance() {
    return BuildWidget();
  }

  Widget _createDefault() {
    return Container(
      child: Text(
        DateTime.now().toString().split(" ")[0],
        style: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
      ),
      alignment: Alignment.center,
    );
  }
}
