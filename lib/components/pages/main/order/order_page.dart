import 'package:flutter/material.dart';
import 'package:flutter_demo/config/colors.dart';
/// 订单页面
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text("订单页面"),
      ),
    );
  }
}
