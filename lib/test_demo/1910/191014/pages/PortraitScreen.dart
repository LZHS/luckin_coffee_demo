import 'package:flutter/material.dart';

class PortraitScreen extends StatefulWidget {
  @override
  _PortraitScreenState createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portrait"),
      ),
      body: Center(
        child: Text("Portrait 页面"),
      ),
    );
  }
}