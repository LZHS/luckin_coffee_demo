import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 咖啡钱包 使用规则 页面
class ServiceRegulationsPage extends StatefulWidget {
  @override
  _ServiceRegulationsPageState createState() => _ServiceRegulationsPageState();
}

class _ServiceRegulationsPageState extends State<ServiceRegulationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "",
        backIcon: buildIcon(),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0,top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "使用规则",
                style: TextStyle(color: appBarTitleColor, fontSize: 28.0),
              ),
              buildText("1. 咖啡钱包是 luckin coffee 的优惠买赠和储杯方式;"),
              buildText("2. 您可通过优惠活动提前充购预存饮品券(例如充2赠1)，也可通过参与邀请好友活动获得饮品券;"),
              buildText(
                  "3. 品券分为21元、24元、27元三种，分别对应三档饮品价格，结算时，饮品券可抵扣相应面额的商品费用，但不包含风味糖浆及配送费，不设找零，超额需补差价，一次可使用多张饮品券;"),
              buildText("4. 咖啡钱包饮品券有效期三年。"),
            ],
          ),
        ),
      ),
    );
  }

  buildText(String content) {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top:24.0),
      child: Text(
        content,
        style: TextStyle(color: Color(0xff505050), fontSize: 16.0, height: 1.5),
      ),
    );
  }

  buildIcon() {
    const String _iconPath = "lib/assets/images/specification/icon_close.png";
    return Image(
      image: AssetImage(_iconPath),
      width: 20.0,
      height: 20.0,
      fit: BoxFit.fill,
      alignment: Alignment.center,
    );
  }
}
