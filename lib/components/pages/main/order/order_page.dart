import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/config/colors.dart';

/// 订单页面
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  List<String> barTitles = ["全部", "未完成", "已完成"];
  List<Widget> barWidgets = List();
  TabController _tabController;
  _OrderPageState() {
    barWidgets
      ..clear()
      ..add(createAllOrder())
      ..add(createUnfinishedOrder())
      ..add(createFinishedOrder());
      
  }

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(
      initialIndex: 0,
      length: barTitles.length,
      vsync: this,
    );
    this._tabController.addListener(() {
      Log.d("this._tabController = ${this._tabController}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          /// 状态栏
          Container(
            width: double.infinity,
            height: 20.0,
          ),

          /// 标题栏
          Container(
            width: double.infinity,
            height: 44.0,
            alignment: Alignment.center,
            child: Text(
              "订单列表",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),


          // tab Bar
        ],
      ),
    );
  }

  /// 创建 所有订单列表
  Widget createAllOrder() {
    return Container(
      child: Center(
        child: Text(
          "所有订单列表",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  /// 创建 未完成订单列表
  Widget createUnfinishedOrder() {
    return Container(
      child: Center(
        child: Text(
          "未完成订单列表",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  /// 创建 已完成订单列表
  Widget createFinishedOrder() {
    return Container(
      child: Center(
        child: Text(
          "已完成订单列表",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
