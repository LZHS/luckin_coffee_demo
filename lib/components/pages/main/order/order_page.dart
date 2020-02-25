import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/divider_widget.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';
import 'package:flutter_demo/components/pages/main/order/list/order_list.dart';
import 'package:flutter_demo/config/res/colors.dart';

/// 订单页面
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  List<String> _barTitles = ["全部", "未完成", "已完成"];
  List<Widget> _barWidgets = List();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(
      initialIndex: 0,
      length: _barTitles.length,
      vsync: this,
    );
    this._tabController.addListener(() {
      Log.d("this._tabController = ${this._tabController}");
    });

    _barWidgets
      ..clear()
      ..add(createAllOrder())
      ..add(createUnfinishedOrder())
      ..add(createFinishedOrder());
  }

  @override
  void dispose() {
    super.dispose();
    this._tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: HeadTitleBar(
        title: "订单列表",
        isShowBack: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 44.0,
            child: TabBar(
              controller: _tabController,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              labelColor: Color(0xff88afd5),
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
              ),
              unselectedLabelColor: Color(0xff505050),
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xff88afd5),
              indicatorPadding: EdgeInsets.zero,
              tabs: _barTitles.map(
                (item) {
                  return Tab(
                    text: item,
                  );
                },
              ).toList(),
            ),
          ),
          DividerWidget(
            color: 0xffa6a6a6,
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: _barWidgets,
            ),
          ),
        ],
      ),
    );
  }

  /// 创建 所有订单列表
  Widget createAllOrder() {
    return OrderList(
      requestPath: "lib/assets/datas/orderAllList.json",
    );
  }

  /// 创建 未完成订单列表
  Widget createUnfinishedOrder() {
    return OrderList(
      requestPath: "lib/assets/datas/orderUnFinishList.json",
    );
  }

  /// 创建 已完成订单列表
  Widget createFinishedOrder() {
    return OrderList(
      requestPath: "lib/assets/datas/orderFinishList.json",
    );
  }
}
