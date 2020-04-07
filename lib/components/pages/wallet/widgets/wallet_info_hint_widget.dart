import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';
import 'package:rxdart/rxdart.dart';

/// 顶部提示 控件，
class WalletInfoHintWidget extends StatefulWidget {
  WalletInfoHintWidget({Key key}) : super(key: key);

  @override
  WalletInfoHintWidgetState createState() {
    return WalletInfoHintWidgetState();
  }
}

class WalletInfoHintWidgetState extends State<WalletInfoHintWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> height, opacity;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    Rx.timer("begion", const Duration(seconds: 5))
        .listen((event) => controller.forward().orCancel);
    Rx.timer("end", const Duration(seconds: 35))
        .listen((event) => controller.reverse().orCancel);
    // 高度动画
    height = Tween<double>(
      begin: 0.0,
      end: 68.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.ease),
    ));
    opacity = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.ease),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Material _buildAnimation(BuildContext context, Widget child) {
    return Material(
      color: backgroundColor,
      child: Ink(
        child: InkResponse(
          highlightColor: Color(0xaaf2f2f2),
          highlightShape: BoxShape.rectangle,
          radius: 0.0,
          containedInkWell: true,
          onTap: () {
            Log.d("跳转至 咖啡钱包 活动描述 页面");
            controller.reverse().orCancel;
            Application.router.navigateTo(
              context,
              activityDescriptionPage,
              transition: TransitionType.inFromRight,
            );
          },
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              width: double.infinity,
              height: height.value,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 4.0,
                      ),
                      child: Image.asset(
                        "lib/assets/images/wallet/icon_hint.png",
                        width: 14.0,
                        height: 14.0,
                      ),
                    ),
                  ),
                  TextSpan(
                      text: "购买以下饮品券享",
                      style: TextStyle(fontSize: 13.0, color: text505050),
                      children: [
                        TextSpan(
                          text: "充2赠1",
                          style: TextStyle(fontSize: 13.0, color: textff8d1a),
                        ),
                      ]),
                  TextSpan(
                    text: "，不同饮品券可组合购买。",
                    style: TextStyle(fontSize: 13.0, color: text505050),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
