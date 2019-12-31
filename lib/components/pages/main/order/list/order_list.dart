import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/components/pages/main/order/beans/order_bean.dart';
import 'package:flutter_demo/components/pages/main/order/enums/order_state_enum.dart';
import 'package:flutter_demo/components/pages/main/order/widgets/order_widge.dart';
import 'package:flutter_demo/config/Routes.dart';
import 'package:flutter_demo/config/application.dart'; 
import 'package:flutter_demo/config/resources.dart';

///```
/// 订单列表 页面
/// requestPath 需加载的数据
///```
///
class OrderList extends StatefulWidget {
  final String requestPath;
  OrderList({Key key, @required this.requestPath})
      : assert(
          requestPath != null && requestPath != "",
          ' 需要加载的数据不能为空 ',
        ),
        super(key: key);
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final List<OrderBean> orderAllData = List();

  @override
  void initState() {
    super.initState();
    this._initData();
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
    if (orderAllData.length != 0) return;
    rootBundle.loadString(widget.requestPath).then((val) {
      List<OrderBean> tempData = List();
      json.decode(val).forEach((json) => tempData.add(
            OrderBean.fromJson(json),
          ));
      if (mounted) {
        setState(() {
          orderAllData
            ..clear()
            ..addAll(tempData);
        });
      }
    });
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
          "$evaluation?orderId=$orderId",
          transition: TransitionType.inFromLeft,
        );
        break;
      default:
    }
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
