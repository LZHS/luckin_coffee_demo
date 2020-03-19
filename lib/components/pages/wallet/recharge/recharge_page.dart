import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 充值咖啡钱包 页面
class RechargePage extends StatefulWidget {
  RechargePage({Key key}) : super(key: key);

  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  int _count = 0;
  bool isAdd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "充值咖啡钱包",
        rightWidget: buildRightWidget(),
        rightCheck: onClickRight,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            buildContentWidget(),
            buildBottomWidget(),
          ],
        ),
      ),
    );
  }

  /// 创建中间 内容控件
  buildContentWidget() {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
         buildHintWidget(),
        ],
      ),
    ));
  }

  /// 创建底部 控件
  buildBottomWidget() {
    return Container(
      width: double.infinity,
      height: 60.0,
      color: Colors.white,
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
    Application.router.navigateTo(
      context,
      privilegePage,
      transition: TransitionType.inFromRight,
    );
  }
/// 创建 提示 widget
  buildHintWidget() {
    return  FractionalTranslation(

      translation: const Offset(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 68.0,
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 4.0,
                ),
                child: Image.asset(
                  "lib/assets/images/wallet/icon_hint.png",
                  width: 14.0,
                  height: 14.0,
                ),
              ),
            ),
            TextSpan(
                text: "购买以下饮品券享",
                style: TextStyle(fontSize: 13.0, color: text505050),
                children: [
                  TextSpan(
                    text: "充2赠1",
                    style: TextStyle(fontSize: 13.0, color: textff8d1a),
                  ),
                ]),
            TextSpan(
              text: "，不同饮品券可组合购买。",
              style: TextStyle(fontSize: 13.0, color: text505050),
            ),
          ]),
        ),
      ),
    );
  }
}

/**
    Center(
    child: AddAnimateWidget(_count, isAdd, (action) {
    setState(() {
    switch (action) {
    case ActionEnum.add:
    _count++;
    isAdd = true;
    break;
    case ActionEnum.subtraction:
    _count--;
    isAdd = false;
    break;
    }
    });
    }),
    ),
 */
