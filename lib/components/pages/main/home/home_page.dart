import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/custom_swiper/custom_swiper.dart';
import 'package:flutter_demo/components/pages/main/home/animation/box_move_animation.dart';
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
            createTabItem(
              "中海国际中心",
              "距您53m",
              onTap: () => Log.d("中海国际中心 距您53m"),
              customWidget: BoxMoveAnimation(),
            ),
            createTabItem(
              "现在下单",
              "ORDER NOW",
              imgPath: "lib/assets/images/home/icon_coffee_cup.png",
              onTap: () => Log.d("现在下单"),
            ),
            createTabItem(
              "咖啡钱包",
              "COFFRR WALLET",
              imgPath: "lib/assets/images/home/icon_coffee_wallet.png",
              onTap: () => Log.d("咖啡钱包"),
            ),
            createTabItem(
              "送Ta咖啡",
              "SEND COFFEE",
              imgPath: "lib/assets/images/home/icon_coffee_gift.png",
              onTap: () => Log.d("送Ta咖啡"),
            ),
            createTabItem(
              "企业账户",
              "ENTERPRISE ACCOUNT",
              imgPath: "lib/assets/images/home/icon_coffee_account.png",
              isShow: false,
              onTap: () => Log.d("企业账户"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 55.0,
              width: double.infinity,
              child: GestureDetector(
                onTap: () => Log.d(" 你点了 下面的广告 "),
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

/// 创建 item 组件
createTabItem(
  String mainTitle,
  String subTitle, {
  String imgPath,
  bool isShow = true,
  GestureTapCallback onTap,
  Widget customWidget,
}) {
  return Material(
    child: Ink(
      child: InkWell(
        onTap: onTap != null ? onTap : () => Log.d("你点击了我呢"),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  height: 24.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    mainTitle,
                                    style: TextStyle(
                                      color: Color(0xff383838),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 17.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    subTitle,
                                    style: TextStyle(
                                      color: Color(0x64808080),
                                      fontSize: 11.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          customWidget != null
                              ? customWidget
                              : Container(
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
                                    image: AssetImage(imgPath),
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
                        color: isShow ? Color(0xfff2f2f2) : Colors.transparent,
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
            onTap: () => Log.d("你 单击了 扫码按钮"),
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
