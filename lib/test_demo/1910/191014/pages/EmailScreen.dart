
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email"),
      ),
      body: Center(
        child: Text("Email 页面"),
      ),
    );
  }
}