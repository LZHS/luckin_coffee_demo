import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/test_demo/1909/190930/SamplePage.dart';

class SimpleDemo extends StatefulWidget {
  @override
  _SimpleDemoState createState() => _SimpleDemoState();
}

class _SimpleDemoState extends State<SimpleDemo> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many tiems:"),
            Text("$_counter"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SamplePage(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "点击我跳转到Sample页面",
                  style:
                      TextStyle(fontSize: 28.0, color: Colors.greenAccent[500]),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            ), //
          ],
        ),
      ),
    );
  }
}
