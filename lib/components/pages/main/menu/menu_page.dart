import 'package:flutter/material.dart';
import 'package:flutter_demo/config/colors.dart';

/// 菜单页面
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text("菜单页面"),
      ),
    );
  }
}
