import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/divider_widget.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 确认订单页面
// ignore: must_be_immutable
class MakeSureOrderPage extends StatefulWidget {
  final String productListStr;
  List<CoffeeWalletItem> productList = [];

  MakeSureOrderPage({Key key, this.productListStr})
      : assert(productListStr.isNotEmpty),
        super(key: key) {
    jsonDecode(productListStr).forEach((element) {
      productList.add(CoffeeWalletItem.fromJson(element));
    });
  }

  @override
  _MakeSureOrderPageState createState() => _MakeSureOrderPageState();
}

class _MakeSureOrderPageState extends State<MakeSureOrderPage> {
  double totalPrice = 0.0;
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(title: "确认订单"),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildContentWidget(),
            _buildBottomWidget(),
          ],
        ),
      ),
    );
  }

  _buildContentWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: _buildOrderWidgets()
            ..add(_buildPlayModeWidget())
            ..add(_buildPaymentAgreementWidget()),
        ),
      ),
    );
  }

  List<Widget> _buildOrderWidgets() {
    List<Widget> orderWidgets = [];
    totalPrice = 0.0;
    this.widget.productList.forEach((item) {
      int remainingNum = int.parse(item.remainingNum);
      double price = double.parse(item.price);
      totalPrice += (remainingNum * price);
      Container itemWidget = Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${item.category + item.scopeOf}",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: appBarTitleColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "x1",
                          style: TextStyle(
                              fontSize: 12.0, color: appBarTitleColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "￥${item.price}",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: appBarTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "共${item.remainingNum}张",
                      style: TextStyle(fontSize: 14.0, color: appBarTitleColor),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "小计",
                          style: TextStyle(
                              fontSize: 14.0, color: appBarTitleColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "￥${remainingNum * price}",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: appBarTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ));
      orderWidgets.add(itemWidget);
    });

    return orderWidgets;
  }

  /// 创建 支付方式选择 控件
  _buildPlayModeWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Material(
        color: Colors.white,
        child: Ink(
          child: InkResponse(
            highlightColor: backgroundColor,
            highlightShape: BoxShape.rectangle,
            radius: 0.0,
            containedInkWell: true,
            onTap: _choosePlayMode,
            child: SizedBox(
              width: double.infinity,
              height: 44.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "支付方式",
                      style: TextStyle(fontSize: 14.0, color: appBarTitleColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "微信支付",
                          style: TextStyle(fontSize: 13.0, color: text505050),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image.asset(
                            "lib/assets/images/login/icon_login_back.png",
                            width: 14.0,
                            height: 14.0,
                            fit: BoxFit.fill,
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

  /// 创建支付协议
  _buildPaymentAgreementWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _onChanged,
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Image.asset(isActive
                          ? "lib/assets/images/wallet/icon_check.png"
                          : "lib/assets/images/wallet/icon_check_un.png"),
                    ),
                    Text("我已阅读并同意",
                        style: TextStyle(fontSize: 11.0, color: text808080)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _goPaymentAgreementPage,
                behavior: HitTestBehavior.opaque,
                child: Text(
                  " 《支付协议》 ",
                  style: TextStyle(fontSize: 11.0, color: text557a9d),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, bottom: 10.0),
            child: Text(
              "温馨提示：仅支持开具电子发票，订单完成后可前往发票管理中开具",
              style: TextStyle(fontSize: 11.0, color: textHintColor),
            ),
          ),
        ],
      ),
    );
  }

  /// 创建底部 控件
  _buildBottomWidget() {
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

  _goPaymentAgreementPage() {
    Log.d("跳转至 支付协议 页面");
    Application.router.navigateTo(
      context,
      paymentAgreementPage,
      transition: TransitionType.inFromRight,
    );
  }

  _onChanged() {
    Log.d("是否选中 $isActive");
    setState(() {
      isActive = !isActive;
    });
  }

  _choosePlayMode() {
    Log.d("点击选择 支付方式");
    showToast("点击选择 支付方式 --- 微信");
  }

  toSettleAccounts() {
    Log.d("去结算");
    if (!isActive) {
      showToast("请阅读并同意《支付协议》");
      return;
    }
  }
}
