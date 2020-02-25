import 'package:flutter/material.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';
import 'package:flutter_demo/config/res/colors.dart';

/// 购物车页面
class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    var text = Container(
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
    );

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
                //TODO 点击效果未完成  https://www.jb51.net/article/165557.htm
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff90c0ef)), 
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                child: InkResponse(
                  borderRadius: new BorderRadius.circular(4.0),
                  child: text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
