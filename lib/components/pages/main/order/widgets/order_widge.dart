import 'package:flutter/material.dart';
import 'package:flutter_demo/components/pages/main/order/beans/order_bean.dart';

///```
/// 订单模块 item 布局
/// OrderBean 为每个订单元素数据
///```
class OrderWidge extends StatefulWidget {
  final OrderBean _order;
  OrderWidge(this._order);

  @override
  _OrderWidgeState createState() => _OrderWidgeState();
}

class _OrderWidgeState extends State<OrderWidge> {
  @override
  Widget build(BuildContext context) { 
    return Container();
  }
}
