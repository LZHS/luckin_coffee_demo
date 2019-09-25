

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaterialApp01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
      ),   
    );
  }
}