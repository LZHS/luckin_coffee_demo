import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/custom_swiper/custom_swiper.dart';
import 'package:flutter_demo/config/colors.dart';

///```
/// 首页页面
///```
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            createBanner(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Log.d("青年汇店");
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 69.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 24.0,
                                        alignment: Alignment.center,
                                        child: titleText("青年汇店"),
                                      ),
                                      Container(
                                        height: 17.0,
                                        alignment: Alignment.center,
                                        child: infoText("距您53m"),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.orange,
                                  /// TODO 实现按钮滑动效果， 以及Item 点击效果
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Log.d("现在下单");
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 69.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 24.0,
                                        alignment: Alignment.center,
                                        child: titleText("现在下单"),
                                      ),
                                      Container(
                                        height: 17.0,
                                        alignment: Alignment.center,
                                        child: infoText("ORDER NOW"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff63473a),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/home/icon_coffee_cup.png"),
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Log.d("咖啡钱包");
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 69.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 24.0,
                                        alignment: Alignment.center,
                                        child: titleText("咖啡钱包"),
                                      ),
                                      Container(
                                        height: 17.0,
                                        alignment: Alignment.center,
                                        child: infoText("COFFRR WALLET"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff63473a),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/home/icon_coffee_wallet.png"),
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Log.d("送Ta咖啡");
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 69.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 24.0,
                                        alignment: Alignment.center,
                                        child: titleText("送Ta咖啡"),
                                      ),
                                      Container(
                                        height: 17.0,
                                        alignment: Alignment.center,
                                        child: infoText("SEND COFFEE"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff63473a),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/home/icon_coffee_gift.png"),
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Log.d("企业账户");
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 69.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 24.0,
                                  alignment: Alignment.center,
                                  child: titleText("企业账户"),
                                ),
                                Container(
                                  height: 17.0,
                                  alignment: Alignment.center,
                                  child: infoText("ENTERPRISE ACCOUNT"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff63473a),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage(
                                  "lib/assets/images/home/icon_coffee_account.png"),
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 55.0,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Log.d(" 你点了 下面的广告 ");
                },
                child: Image(
                  image: AssetImage("lib/assets/images/home/bottom_bar.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
           Container(
             height: 20.0,
             width: double.infinity,
           )
          ],
        ),
      ),
    );
  }
}

titleText(String msg) {
  return Text(
    msg,
    style: TextStyle(
      color: Color(0xff383838),
      fontSize: 16.0,
    ),
  );
}

infoText(String msg) {
  return Text(
    msg,
    style: TextStyle(
      color: Color(0x64808080),
      fontSize: 11.0,
    ),
  );
}

/// 创建 头部 Banner组件
createBanner() {
  return Stack(
    children: <Widget>[
      /// 轮播图
      Positioned(
        child: CustomSwiper(
          [
            "lib/assets/images/banners/icon_banner01.jpg",
            "lib/assets/images/banners/icon_banner02.jpg",
            "lib/assets/images/banners/icon_banner03.jpg",
          ],
          height: screenHeight() > 800 ? 288 : 208,
        ),
      ),

      ///  扫码
      Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(top: 30.0, right: 10.0),
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0x1e000000),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () => {Log.d("你 单击了 扫码按钮")},
            child: Image(
              image: AssetImage("lib/assets/images/home/icon_scanning.png"),
              width: 24.0,
              height: 21.0,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    ],
  );
}
