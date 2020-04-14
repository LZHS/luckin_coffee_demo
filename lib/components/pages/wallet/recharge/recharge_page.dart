import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/product_item_widget.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_info_hint_widget.dart';
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
  final Set productList = Set<CoffeeWalletItem>();
  final itemDatas = <CoffeeWalletItem>[];
  double totalPrice = 0.0;

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
            WalletInfoHintWidget(),
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
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: backgroundColor, width: 1.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(left: 15.0),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: "应付合计",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff383838)),
                  children: [
                    TextSpan(
                      text: " ￥$totalPrice",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff383838)),
                    )
                  ]),
            ),
          ),
          Material(
              color: const Color(0xff90c0ef),
              child: Ink(
                  child: InkResponse(
                highlightColor: Color(0xff60a0ff),
                highlightShape: BoxShape.rectangle,
                radius: 0.0,
                containedInkWell: true,
                onTap: toSettleAccounts,
                child: Container(
                  width: 120.0,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "去结算",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ))),
        ],
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
    Application.router.navigateTo(
      context,
      privilegePage,
      transition: TransitionType.inFromRight,
    );
  }

  buildItemWidget(CoffeeWalletItem walletItem) {
    return ProductItemWidget(
      itemData: walletItem,
      itemActionCallback: itemCheck,
    );
  }

  void toSettleAccounts() {
    Log.d("去结算");
    if (productList.length == 0 || totalPrice == 0.0) {
      showToast("请先选择商品");
      return;
    }
    Application.router.navigateTo(
      context,
      makeSureOrderPage + "?productList=${jsonEncode(productList.toList())}",
      transition: TransitionType.inFromRight,
    );
  }

  void itemCheck(CoffeeWalletItem item) {
    productList.add(item);
    totalPrice = 0.0;
    productList.forEach((element) {
      int remainingNum = int.parse(element.remainingNum);
      double price = double.parse(element.price);
      totalPrice += (remainingNum * price);
    });
    setState(() {});
  }

  void getAllItems() {
    rootBundle
        .loadString("lib/assets/datas/coffeeWalletList.json")
        .then((valStr) {
      itemDatas.clear();
      json.decode(valStr).forEach((item) {
        CoffeeWalletItem tempItem = CoffeeWalletItem.fromJson(item);
        tempItem.remainingNum = "0";
        itemDatas.add(tempItem);
      });
      setState(() {});
    });
  }
}
