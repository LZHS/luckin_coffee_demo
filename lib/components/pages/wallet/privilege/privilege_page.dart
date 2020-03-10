import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 优惠活动页面
class PrivilegePage extends StatefulWidget {
  PrivilegePage({Key key}) : super(key: key);

  @override
  _PrivilegePageState createState() => _PrivilegePageState();
}

class _PrivilegePageState extends State<PrivilegePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "优惠活动",
        rightWidget: buildRightWidget(),
        rightCheck: onClickRight,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Text("优惠活动"),
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
        "全部优惠",
        style: TextStyle(fontSize: 14.0, color: appBarTitleColor),
      ),
    );
  }

  onClickRight() {
    Log.d("全部优惠");
    Application.router.navigateTo(
      context,
      privilegeAllPage,
      transition: TransitionType.inFromLeft,
    );
  }
}
