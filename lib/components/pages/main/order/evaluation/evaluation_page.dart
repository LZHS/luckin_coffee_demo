import 'package:flutter/material.dart';

///```
/// 订单评价页面
/// orderId 将要评价的 订单ID
///```
class EvaluationPage extends StatefulWidget {
  final String orderId;

  const EvaluationPage({Key key, @required this.orderId}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("订单评价页面"),
      ),
    );
  }
}
