import 'package:flutter/material.dart';
import 'package:flutter_demo/config/resources.dart';

/// ```
/// 个人中心页面
/// ```
class PersionCenterPage extends StatefulWidget {
  @override
  _PersionCenterPageState createState() => _PersionCenterPageState();
}

class _PersionCenterPageState extends State<PersionCenterPage> {
  List itemDatas = [
    {
      "icon": "lib/assets/images/persion/icon_personal_data.png",
      "title": "个人资料",
      "subTitle": "",
      "isShowDivi": true,
    },
    {
      "icon": "lib/assets/images/persion/icon_wallet.png",
      "title": "咖啡钱包",
      "subTitle": "7杯",
      "isShowDivi": true,
    },
    {
      "icon": "lib/assets/images/persion/icon_coupons.png",
      "title": "优惠券",
      "subTitle": "6张",
      "isShowDivi": true,
    },
    {
      "icon": "lib/assets/images/persion/icon_cash_discount.png",
      "title": "兑换优惠",
      "subTitle": "",
      "isShowDivi": true,
    },
    {
      "icon": "lib/assets/images/persion/icon_invoice_management.png",
      "title": "发票管理",
      "subTitle": "",
      "isShowDivi": false,
    },
    {
      "icon": "lib/assets/images/persion/icon_help_feedback.png",
      "title": "帮助反馈",
      "subTitle": "",
      "isShowDivi": false,
    },
  ];

  List<Container> itemWidgets = new List();

  @override
  void initState() {
    super.initState();

    initItemWidget();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "lib/assets/images/persion/icon_persion_head.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          createItemWidgets(),
          Container(
            width: double.infinity,
            height: 130.0,
            padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
            child: Image(
                image: AssetImage(
                    "lib/assets/images/persion/icon_persion_advertising.jpg"),
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  createItemWidgets() {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[],
      ),
    );
  }

  ///```
  /// 初始化 Item 空间列表
  ///```
  initItemWidget() {
    itemDatas.forEach(
      (item) {
        itemWidgets.add(
          createItem(
            item.icon,
            item.title,
            item.subTitle,
            item.isShowDivi,
          ),
        );
      },
    );
  }

  ///```
  /// 创建单个 Item  控件
  ///```
  createItem(String icon, String title, String subTitle, bool isShowDivi) {

    // TODO: 该实现 创建单个 Item  控件
    return Container();
  }
}
