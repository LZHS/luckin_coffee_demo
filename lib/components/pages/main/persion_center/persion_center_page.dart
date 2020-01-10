import 'package:flutter/material.dart';
import 'package:flutter_demo/common/widgets/divider_widget.dart';
import 'package:flutter_demo/components/pages/main/persion_center/bean/item_data.dart';
import 'package:flutter_demo/config/resources.dart';

/// ```
/// 个人中心页面
/// ```
class PersionCenterPage extends StatefulWidget {
  @override
  _PersionCenterPageState createState() => _PersionCenterPageState();
}

class _PersionCenterPageState extends State<PersionCenterPage> {
  List<ItemData> itemDatas = [
    ItemData(
        icon: "lib/assets/images/persion/icon_personal_data.png",
        title: "个人资料",
        subTitle: "",
        isShowDivi: true),
    ItemData(
        icon: "lib/assets/images/persion/icon_wallet.png",
        title: "咖啡钱包",
        subTitle: "7杯",
        isShowDivi: true),
    ItemData(
        icon: "lib/assets/images/persion/icon_coupons.png",
        title: "优惠券",
        subTitle: "6张",
        isShowDivi: true),
    ItemData(
        icon: "lib/assets/images/persion/icon_cash_discount.png",
        title: "兑换优惠",
        subTitle: "",
        isShowDivi: true),
    ItemData(
        icon: "lib/assets/images/persion/icon_invoice_management.png",
        title: "发票管理",
        subTitle: "",
        isShowDivi: false),
    ItemData(
        icon: "lib/assets/images/persion/icon_help_feedback.png",
        title: "帮助反馈",
        subTitle: "",
        isShowDivi: false),
  ];

  List<Container> itemWidgets = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
      ),
    );
  }

  createItemWidgets() { 
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          createItem(itemDatas.elementAt(0)),
          createItem(itemDatas.elementAt(1)),
          createItem(itemDatas.elementAt(2)),
          createItem(itemDatas.elementAt(3)),
          createItem(itemDatas.elementAt(4)),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: createItem(itemDatas.elementAt(5)),
          ),
        ],
      ),
    );
  }

  ///```
  /// 创建单个 Item  控件
  ///```
  createItem(ItemData item) {
    
// TODO: 这里将要实现按钮的单击事件以及 单机效果
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image(
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.scaleDown,
                      image: AssetImage(item.icon),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Color(0xff383838),
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 18.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: item.subTitle == ""
                            ? Container()
                            : Text(
                                item.subTitle,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xffa6a6a6),
                                ),
                              ),
                      ),
                      Image(
                        width: 14.0,
                        height: 14.0,
                        fit: BoxFit.scaleDown,
                        image: AssetImage(
                            "lib/assets/images/persion/icon_persion_back.png"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          item.isShowDivi ? DividerWidget() : Container(),
        ],
      ),
    );
  }
}
