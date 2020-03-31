import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 顶部提示 控件，
class WalletInfoHintWidget extends StatefulWidget {
  WalletInfoHintWidget({Key key}) : super(key: key);

  @override
  _WalletInfoHintWidgetState createState() =>
      _WalletInfoHintWidgetState();
}

class _WalletInfoHintWidgetState
    extends State<WalletInfoHintWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68.0,
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
    );
  }
}