import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/animates/slide_transition_x.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/add_animate_widget.dart';
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
      child: Center(
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
    );
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
}
