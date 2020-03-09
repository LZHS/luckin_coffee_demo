import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 充值咖啡钱包 页面
class RechargePage extends StatefulWidget {
  RechargePage({Key key}) : super(key: key);

  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "充值咖啡钱包",
        rightWidget: buildRightWidget(),
        rightCheck: onClickRight(),
      ),
      body: SafeArea(
        child: Container(
          //TODO 这里将要实现页面布局
        ),
      ),
    );
  }

  buildRightWidget() {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Text(
        "更多优惠",
        style: TextStyle(fontSize: 14.0, color: appBarTitleColor),
      ),
    );
  }

  onClickRight() {
    Log.d("更多优惠");
  }
}
