
import 'package:flutter/material.dart';

class AirlpayScreen extends StatefulWidget {
  @override
  _AirlpayScreenState createState() => _AirlpayScreenState();
}

class _AirlpayScreenState extends State<AirlpayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Airlpay"),
      ),
      body: Center(
        child: Text("Airlpay 页面"),
      ),
    );
  }
}