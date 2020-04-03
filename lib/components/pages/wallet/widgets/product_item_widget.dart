import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/add_animate_widget.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 充值咖啡钱包 具体产品 页面
class ProductItemWidget extends StatelessWidget {
  final CoffeeWalletItem itemData;
  ItemActionCallback itemActionCallback;

  ProductItemWidget({
    Key key,
    this.itemData,
    this.itemActionCallback,
  })  : assert(itemData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 80.0,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xfff2f2f2),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "¥",
                    style: TextStyle(fontSize: 14.0, color: appBarTitleColor),
                  ),
                  TextSpan(
                    text: itemData.price,
                    style: TextStyle(fontSize: 24.0, color: appBarTitleColor),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 48.0),
              child: Text(
                itemData.category + itemData.scopeOf,
                style: TextStyle(color: appBarTitleColor, fontSize: 14.0),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 75.0,
                  height: 22.0,
                  margin: const EdgeInsets.only(right: 10.0),
                  child: AddAnimateWidget(int.parse(itemData.remainingNum),
                      (result) {
                    itemData.remainingNum = "$result";
                    itemActionCallback(itemData);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef ItemActionCallback = void Function(CoffeeWalletItem item);
