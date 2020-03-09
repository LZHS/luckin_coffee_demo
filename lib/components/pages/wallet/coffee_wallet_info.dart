import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_bottom_menu.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 咖啡钱包详情页面
// ignore: must_be_immutable
class CoffeeWalletInfo extends StatefulWidget {
  CoffeeWalletItem item;

  CoffeeWalletInfo(String itemJson) {
    this.item = CoffeeWalletItem.fromJson(jsonDecode(itemJson));
  }

  @override
  _CoffeeWalletInfoState createState() => _CoffeeWalletInfoState();
}

class _CoffeeWalletInfoState extends State<CoffeeWalletInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(title: "咖啡钱包"),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: Material(
              color: backgroundColor,
              child: Column(
                children: <Widget>[
                  buildItemWidget(),
                ],
              ),
            ),
          ),
          buildBottomWidget(),
        ]),
      ),
    );
  }

  /// 创建底部 菜单按钮
   buildBottomWidget() {
    return WalletBottomMenu();
  }



  /// 创建中间的Item
  buildItemWidget() {
    return Material(
      color: Colors.white,
      child: Container(
        height: 80.0,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xfff2f2f2),
            width: 1.0,
          ),
        ),
        child: Material(
          color: Colors.white,
          child: Ink(
            child: InkResponse(
              highlightColor: Color(0xaaf2f2f2),
              highlightShape: BoxShape.rectangle,
              radius: 0.0,
              containedInkWell: true,
              onTap: onClickItem,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              "¥",
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff383838)),
                            ),
                            Text(
                              this.widget.item.price,
                              style: TextStyle(
                                  fontSize: 24.0, color: Color(0xff383838)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Text(
                            "尚余${this.widget.item.remainingNum}杯",
                            style: TextStyle(
                              color: Color(0xffa6a6a6),
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 48.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          this.widget.item.category + this.widget.item.scopeOf,
                          style: TextStyle(
                              color: appBarTitleColor, fontSize: 14.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image(
                            image: AssetImage(
                                "lib/assets/images/wallet/icon_hint.png"),
                            width: 14.0,
                            height: 14.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 点击Item
  onClickItem() {
    Log.d("跳转至 咖啡钱包 使用规则 页面");
    Application.router.navigateTo(
      context,
      serviceRegulationsPage,
      transition: TransitionType.inFromLeft,
    );
  }
}
