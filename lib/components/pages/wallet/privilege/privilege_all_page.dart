import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';

/// 全部优惠 页面
class PrivilegeAllPage extends StatefulWidget {
  PrivilegeAllPage({Key key}) : super(key: key);

  @override
  _PrivilegeAllPageState createState() => _PrivilegeAllPageState();
}

class _PrivilegeAllPageState extends State<PrivilegeAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "全部优惠",
      ),
      body: SafeArea(
        child: Container(
          alignment:  Alignment.center,
          child: Text("全部优惠"),
        ),
      ),
    );
  }
}