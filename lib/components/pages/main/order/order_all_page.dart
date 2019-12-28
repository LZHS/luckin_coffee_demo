import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/components/pages/main/order/beans/order_bean.dart';
import 'package:flutter_demo/components/pages/main/order/enums/order_state_enum.dart';
import 'package:flutter_demo/components/pages/main/order/widgets/order_widge.dart';

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
            OrderWidge(orderAllData.elementAt(index)),
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
}

typedef SDFGDCallback = void Function(int indxt, OrderStateEnum stateEnum);
