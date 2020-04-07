import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// 支付协议 顶部提示 控件，
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

    Rx.timer("begion", const Duration(seconds: 1))
        .listen((event) => controller.forward().orCancel);
    // 高度动画
    height = Tween<double>(
      begin: 0.0,
      end: 120.0,
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

  Opacity _buildAnimation(BuildContext context, Widget child) {
    return Opacity(
      opacity: opacity.value,
      child: Container(
        width: double.infinity,
        height: height.value,
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            text: "特别提示：",
            style: TextStyle(color: Color(0xffff6464), fontSize: 13.0),
            children: [
              TextSpan(
                text:
                    "您在同意授权书前应完整、仔细地阅读本授权书，您勾选同意将被视为完全理解并接受以下全部授权书条款。您在luckin coffee.上勾选同意本支付授权书后，即成为本支付授权书之授权人，该授权即刻发生效力。您如果不同意以下授权书条款，请勿勾选同意，且不要进行后续操作。",
                style: TextStyle(
                  height: 1.2,
                  color: Color(0x64a6a6a6),
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 Container(
                padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                child: 
              ),
 */
