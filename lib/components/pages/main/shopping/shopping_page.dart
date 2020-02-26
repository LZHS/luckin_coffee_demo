import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';
import 'package:flutter_demo/config/Routes.dart';
import 'package:flutter_demo/config/application.dart';

/// 购物车页面
class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "购物车",
        isShowBack: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 56.0),
              child: Image.asset(
                "lib/assets/images/shopping/icon_shopping_no_login.png",
                width: 90.0,
                height: 60.0,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
              ),
              child: Text(
                "您的购物车有点寂寞",
                style: TextStyle(
                  color: Color(0xffa6a6a6),
                  fontSize: 13.0,
                ),
              ),
            ),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff90c0ef)),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  color: Colors.transparent,
                ),
                child: InkResponse(
                  borderRadius: new BorderRadius.circular(4.0),
                  highlightColor: Color(0x9990c0ef),
                  highlightShape: BoxShape.rectangle,
                  splashColor: Color(0xcc90c0ef),
                  containedInkWell: true,
                  radius: 100.0,
                  onTap: goDrink,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.0,
                    height: 30.0,
                    child: Text(
                      "去喝一杯",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff90c0ef),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 点击去喝一杯按钮
  void goDrink() {
    Log.d("点击去喝一杯按钮");

    /// TODO 这里将要判断用户是否登录 这里假设用户未登陆 
    Application.router.navigateTo(
      context,
      login,
      transition: TransitionType.inFromLeft,
    );
  }
}
