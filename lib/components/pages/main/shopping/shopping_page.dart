import 'package:flutter/material.dart';
import 'package:flutter_demo/config/resources.dart'; 

/// 购物车页面
class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text("购物车页面"),
      ),
    );
  }
}