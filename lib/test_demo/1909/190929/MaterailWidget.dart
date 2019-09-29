import 'package:flutter/material.dart';
import 'package:flutter_demo/test_demo/1909/190929/ContainerLayout.dart';

class MaterailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      theme: ThemeData(
        primaryColor: Colors.redAccent[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MaterialWidget"),
        ),
        body: ContainerLayout(),
      ),
    );
  }
}
