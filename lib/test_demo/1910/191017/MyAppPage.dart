import 'package:flutter/material.dart';

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyAppPage 页面"),
      ),
      body: RaisedButton(
        child: Text("返回上一个"),
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
      ),
    );
  }
}
