import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_info_hint_widget.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 充值咖啡钱包 页面
class RechargePage extends StatefulWidget {
  RechargePage({Key key}) : super(key: key);

  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage>
    with SingleTickerProviderStateMixin {
  final dataTye = [0, 1];
  final itemDatas = <CoffeeWalletItem>[];
  final _globalKey = GlobalKey<AnimatedListState>();
  var isShow = false;
  int _count = 0;
  final _tweenIn = Tween<Offset>(
    begin: Offset(0, 1),
    end: Offset(0, 0),
  );
  final _tweenOut = Tween<Offset>(
    begin: Offset(0, 0),
    end: Offset(0, 1),
  );

  _RechargePageState() {
    getAllItems();
  }

  @override
  void initState() {
    super.initState();
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
        child: Container(
      width: double.infinity,
      height: double.infinity,
      child: AnimatedList(
        key: _globalKey,
        initialItemCount: itemDatas.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                _itemBuilder(context, index, animation),
      ),
    ));
  }

  _itemBuilder(BuildContext context, int index, Animation<double> animation) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
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

//    Application.router.navigateTo(
//      context,
//      privilegePage,
//      transition: TransitionType.inFromRight,
//    );
  }

  /// 创建 提示 widget
  buildHintWidget(animation) {
    return SlideTransition(
        position: animation.drive(isShow ? _tweenIn : _tweenOut),
        child: WalletInfoHintWidget());
  }

  void getAllItems() {
    changData(index, item) {
      Log.d("changData $index");
      _globalKey.currentState.insertItem(index, duration: Duration(seconds: 1));
      itemDatas.add(CoffeeWalletItem.fromJson(item));
    }

    rootBundle
        .loadString("lib/assets/datas/coffeeWalletList.json")
        .then((valStr) {
      itemDatas.clear();
      List tempItem = json.decode(valStr);
      for(int index=0 ;index<tempItem.length;index++ ){
        changData(index,tempItem.elementAt(index));
      }
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
