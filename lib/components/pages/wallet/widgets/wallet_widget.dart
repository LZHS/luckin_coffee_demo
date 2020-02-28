import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

///```
/// 咖啡钱包 item 布局
///```
class WalletWidget extends StatefulWidget {
  final CoffeeWalletItem itemBean;
  final OnClickCallBack onClickCallBack;
  WalletWidget(
    this.itemBean,
    this.onClickCallBack,
  );
  @override
  _WalletWidgetState createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Image.asset(
                  "lib/assets/images/wallet/icon_wallet_item_bg.png",
                  fit: BoxFit.fill),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Material(
                color: Colors.transparent,
                child: InkResponse(
                  splashColor: Color(0x77aaaaaa),  
                  highlightShape: BoxShape.rectangle,
                  radius: 170.0,
                  containedInkWell: true,
                  onTap: () =>
                      this.widget.onClickCallBack(this.widget.itemBean),
                  child: createItem(),
                ),
              ),
            )
          ],
        ));
  }

  /// 创建 item 显示
  Stack createItem() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10.0,
          left: 20.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                "${this.widget.itemBean.category.substring(0, 1)}",
                style: TextStyle(
                  fontSize: 16.0,
                  color: appBarTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${this.widget.itemBean.category.substring(1, this.widget.itemBean.category.length)}",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: appBarTitleColor,
                ),
              ),
              Text(
                "${this.widget.itemBean.scopeOf}",
                style: TextStyle(
                  fontSize: 13.0,
                  color: appBarTitleColor,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 20.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                "￥",
                style: TextStyle(
                  fontSize: 14.0,
                  color: appBarTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${this.widget.itemBean.price}",
                style: TextStyle(
                  fontSize: 24.0,
                  color: appBarTitleColor,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 15.0,
          bottom: 10.0,
          child: Text(
            "尚余${this.widget.itemBean.remainingNum}杯",
            style: TextStyle(color: textHintColor, fontSize: 13.0),
          ),
        )
      ],
    );
  }
}

typedef OnClickCallBack = void Function(CoffeeWalletItem walletBean);
