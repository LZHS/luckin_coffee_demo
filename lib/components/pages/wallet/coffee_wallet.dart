import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';
import 'package:flutter_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:flutter_demo/components/pages/wallet/widgets/wallet_widget.dart';

///```
/// 咖啡钱包 页面
///```
class CoffeeWallet extends StatefulWidget {
  @override
  _CoffeeWalletState createState() => _CoffeeWalletState();
}

class _CoffeeWalletState extends State<CoffeeWallet> {
  List<CoffeeWalletItem> itemDatas = new List();

  _CoffeeWalletState() {
    getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "咖啡钱包",
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: GridView.builder(
                itemCount: itemDatas.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.6),
                itemBuilder: (context, index) =>
                    WalletWidget(itemDatas[index], onClickCallBack),
              ),
            ),
          ),
          Container(
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
          )
        ]),
      ),
    );
  }

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

  onClickCallBack(CoffeeWalletItem itemBean) {
    Log.d(" 咖啡钱包 点击返回 \n ${itemBean.toString()}");
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
