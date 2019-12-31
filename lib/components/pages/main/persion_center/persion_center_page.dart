import 'package:flutter/material.dart';
import 'package:flutter_demo/config/resources.dart'; 

/// ```
/// 个人中心页面
/// ```
class PersionCenterPage extends StatefulWidget {
  @override
  _PersionCenterPageState createState() => _PersionCenterPageState();
}

class _PersionCenterPageState extends State<PersionCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text("个人中心页面"),
      ),
    );
  }
}