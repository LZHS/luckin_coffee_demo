import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 活动描述页面
class ActivityDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "",
        backIcon: _buildIcon(),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "活动描述",
                  style: TextStyle(color: appBarTitleColor, fontSize: 28.0),
                ),
              ),
              _buildText("1. 不同类型的咖啡钱包“饮品券”可组合充购;"),
              _buildText("2. 不同的充购数量可组合享受“充2赠1”优惠;"),
              _buildText("3. 充购后，所得“饮品券”即存入咖啡钱包中，下单结算时使用，有效期3年。"),
            ],
          ),
        ),
      ),
    );
  }

  _buildIcon() {
    const String _iconPath = "lib/assets/images/specification/icon_close.png";
    return Image(
      image: AssetImage(_iconPath),
      width: 20.0,
      height: 20.0,
      fit: BoxFit.fill,
      alignment: Alignment.center,
    );
  }
  _buildText(String content) {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top:24.0),
      child: Text(
        content,
        style: TextStyle(color: Color(0xff505050), fontSize: 16.0, height: 1.5),
      ),
    );
  }
}
