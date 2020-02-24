import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/common/widgets/divider_widget.dart';
import 'package:flutter_demo/components/pages/main/persion_center/bean/item_data.dart';
import 'package:flutter_demo/config/Routes.dart';
import 'package:flutter_demo/config/application.dart';
import 'package:flutter_demo/config/res/colors.dart'; 

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
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Log.d("你点击了消息提醒");
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        margin: EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        child: Image(
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                              "lib/assets/images/persion/icon_hint.png"),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Log.d("你点击了 用户 信息");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 56.0,
                                height: 56.0,
                                margin: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(28.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "lib/assets/images/persion/icon_persion_test_head.jpeg",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "xiaopiu_😋",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Image(
                              width: 14.0,
                              height: 14.0,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "lib/assets/images/persion/icon_persion_head_back.png"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Color(0x55B2B2B2),
        highlightColor: Color(0x22D4D4D4),
        radius: 375.0,
        onTap: () => clickItem(item),
        child: Container(
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
        ),
      ),
    );
  }

  clickItem(ItemData item) {
    switch (item.title) {
      case "个人资料":
        break;
      case "咖啡钱包":
        Application.router.navigateTo(
          context,
          wallet,
          transition: TransitionType.inFromLeft,
        );
        break;
      case "优惠券":
        break;
      case "兑换优惠":
        break;
      case "发票管理":
        break;
      case "帮助反馈":
        break;
      default:
    }
  }
}
