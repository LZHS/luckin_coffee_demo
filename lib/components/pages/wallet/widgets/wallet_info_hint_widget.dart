import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 顶部提示 控件，
// ignore: must_be_immutable
class WalletInfoHintWidget extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height, opacity;

  WalletInfoHintWidget({Key key, this.controller}) : super(key: key) {
    // 高度动画
    height = Tween<double>(
      begin: 0.0,
      end: 68.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.1, curve: Curves.ease),
    ));
    opacity = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.1, curve: Curves.ease),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Opacity _buildAnimation(BuildContext context, Widget child) {
    return Opacity(
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
    );
  }
}
