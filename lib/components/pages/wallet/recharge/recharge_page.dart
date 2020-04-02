import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_info_hint_widget.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';
import 'package:rxdart/rxdart.dart';

/// 充值咖啡钱包 页面
class RechargePage extends StatefulWidget {
  RechargePage({Key key}) : super(key: key);

  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage>
    with SingleTickerProviderStateMixin {
  final itemDatas = <CoffeeWalletItem>[];
  Animation<double> animation;
  AnimationController controller;

  _RechargePageState() {
    getAllItems();
    Rx.timer("begin", Duration(seconds: 5)).listen((event) {});
  }

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
  }

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
            buildHintWidget(),
            buildContentWidget(),
            buildBottomWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 创建中间 内容控件
  buildContentWidget() {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return buildItemWidget(itemDatas.elementAt(index));
      },
      itemCount: itemDatas.length,
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
    //启动动画(正向执行)
    controller.forward();
//    Application.router.navigateTo(
//      context,
//      privilegePage,
//      transition: TransitionType.inFromRight,
//    );
  }


  /// 创建 提示 widget
  buildHintWidget() {
    return WalletInfoHintWidget(
      controller: controller,
    );
  }

  buildItemWidget(CoffeeWalletItem walletItem) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        alignment: Alignment.center,
        child: Text("类别 ${walletItem.category}"),
      ),
    );
  }

  void getAllItems() {
    changData(item) =>
        setState(() => itemDatas.add(CoffeeWalletItem.fromJson(item)));
    rootBundle
        .loadString("lib/assets/datas/coffeeWalletList.json")
        .then((valStr) {
      itemDatas.clear();
      var tempItem = json.decode(valStr);
      tempItem.forEach(changData);
    });
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
