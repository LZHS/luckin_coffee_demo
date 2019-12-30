import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/components/pages/main/order/beans/order_bean.dart';
import 'package:flutter_demo/components/pages/main/order/enums/order_state_enum.dart';
import 'package:flutter_demo/components/pages/main/order/widgets/order_widge.dart';
import 'package:flutter_demo/config/Routes.dart';
import 'package:flutter_demo/config/application.dart';
import 'package:flutter_demo/config/colors.dart';

///```
/// 订单列表-- 全部页面
///```
class OrderAllPage extends StatefulWidget {
  @override
  _OrderAllPageState createState() => _OrderAllPageState();
}

class _OrderAllPageState extends State<OrderAllPage> {
  final List<OrderBean> orderAllData = List();
  _OrderAllPageState() {
    this._initData();
  }

  /// ```
  /// tab 回调方法
  /// ```
  void onClickEnent(String orderId, OrderStateEnum stateEnum) {
    switch (stateEnum) {
      case OrderStateEnum.align:
        showSnackBar("你点击了 再来一单");
        break;
      case OrderStateEnum.play:
        showSnackBar("你点击了 去支付");
        break;
      case OrderStateEnum.evaluation:
        Application.router.navigateTo(
          context,
          "$evaluation?message=过度页面传递的数据", 
          transition: TransitionType.inFromLeft,
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        itemCount: orderAllData.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            OrderWidge(orderAllData.elementAt(index), onClickEnent),
      ),
    );
  }

  /// 初始化 測試數據
  _initData() {
    rootBundle.loadString("lib/assets/datas/orderAllList.json").then((val) {
      List<OrderBean> tempData = List();
      json.decode(val).forEach((json) => tempData.add(
            OrderBean.fromJson(json),
          ));
      setState(() {
        orderAllData
          ..clear()
          ..addAll(tempData);
      });
    });
  }

  ///```
  /// 显示一个 SnackBar
  /// msg 要显示的消息
  ///```
  showSnackBar(String msg) {
    Scaffold.of(this.context).showSnackBar(SnackBar(
      content: Container(
        width: double.infinity,
        height: 25.0,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          msg,
          style: TextStyle(
              color: Colors.redAccent[200],
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      ),
      behavior: SnackBarBehavior.fixed,
      duration: Duration(milliseconds: 1500),
      backgroundColor: backgroundColor,
    ));
  }
}
