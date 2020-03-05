import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';

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
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff22f2f2),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  "¥",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Color(0xff383838)),
                                ),Text(
                                  this.widget.item.price,
                                  style: TextStyle(
                                      fontSize: 24.0, color: Color(0xff383838)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildBottomWidget(),
        ]),
      ),
    );
  }

  Container buildBottomWidget() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 60.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                splashColor: Color(0x77aaaaaa),
                highlightShape: BoxShape.rectangle,
                radius: 170.0,
                containedInkWell: true,
                onTap: () => onClickEvent(0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/images/wallet/icon_give_preferential.png",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "充赠优惠",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 35.0,
            color: Color(0xffa6a6a6),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                splashColor: Color(0x77aaaaaa),
                highlightShape: BoxShape.rectangle,
                radius: 170.0,
                containedInkWell: true,
                onTap: () => onClickEvent(1),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/images/wallet/icon_want_to_treat.png",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "我要请客",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 35.0,
            color: Color(0xffa6a6a6),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                splashColor: Color(0x77aaaaaa),
                highlightShape: BoxShape.rectangle,
                radius: 170.0,
                containedInkWell: true,
                onTap: () => onClickEvent(2),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/images/wallet/icon_sending_envelope.png",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "发送红包",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 底部 功能选项 单击事件<br/>
  /// 0 -- 充赠优惠<br/>
  /// 1 -- 我要请客<br/>
  /// 2 -- 发送红包
  onClickEvent(int tag) {
    switch (tag) {
      case 0:
        Log.d(" 充赠优惠 ");

        break;
      case 1:
        Log.d(" 我要请客 ");

        break;
      case 2:
        Log.d(" 发送红包 ");

        break;
      default:
    }
  }
}
