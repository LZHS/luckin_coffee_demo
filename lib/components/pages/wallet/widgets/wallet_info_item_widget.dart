import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

///
class WalletInfoItemWidget extends StatelessWidget {
  final CoffeeWalletItem itemData;

  WalletInfoItemWidget(this.itemData);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 80.0,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xfff2f2f2),
            width: 1.0,
          ),
        ),
        child: Material(
          color: Colors.white,
          child: Ink(
            child: InkResponse(
              highlightColor: Color(0xaaf2f2f2),
              highlightShape: BoxShape.rectangle,
              radius: 0.0,
              containedInkWell: true,
              onTap: () => onClickItem(context),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "¥",
                              style: TextStyle(
                                  fontSize: 14.0, color: appBarTitleColor),
                            ),
                            TextSpan(
                              text: itemData.price,
                              style: TextStyle(
                                  fontSize: 24.0, color: appBarTitleColor),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Text(
                            "尚余${itemData.remainingNum}杯",
                            style: TextStyle(
                              color: Color(0xffa6a6a6),
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 48.0),
                    child: RichText(
                      text: TextSpan(
                          text: itemData.category + itemData.scopeOf,
                          style: TextStyle(
                              color: appBarTitleColor, fontSize: 14.0),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset(
                                  "lib/assets/images/wallet/icon_hint.png",
                                  width: 14.0,
                                  height: 14.0,
                                ),
                              ),
                              alignment: PlaceholderAlignment.middle
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 点击Item
  onClickItem(BuildContext context) {
    Log.d("跳转至 咖啡钱包 使用规则 页面");
    Application.router.navigateTo(
      context,
      serviceRegulationsPage,
      transition: TransitionType.inFromRight,
    );
  }
}
