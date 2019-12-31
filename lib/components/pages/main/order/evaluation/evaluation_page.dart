import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';

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
      appBar: HeadTitleBar(
        title: "评价",
      ),
      body: Container(
        child: Text("订单评价页面 \n orderId ${this.widget.orderId}"),
      ),
    );
  }
}
