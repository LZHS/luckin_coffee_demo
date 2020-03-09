import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';

class WalletBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 60.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                splashColor: Color(0x77aaaaaa),
                highlightShape: BoxShape.rectangle,
                radius: 170.0,
                containedInkWell: true,
                onTap: () => onClickEvent(0, context),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/images/wallet/icon_give_preferential.png",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "充赠优惠",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 35.0,
            color: Color(0xffa6a6a6),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                splashColor: Color(0x77aaaaaa),
                highlightShape: BoxShape.rectangle,
                radius: 170.0,
                containedInkWell: true,
                onTap: () => onClickEvent(1, context),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/images/wallet/icon_want_to_treat.png",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "我要请客",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 35.0,
            color: Color(0xffa6a6a6),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                splashColor: Color(0x77aaaaaa),
                highlightShape: BoxShape.rectangle,
                radius: 170.0,
                containedInkWell: true,
                onTap: () => onClickEvent(2, context),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/images/wallet/icon_sending_envelope.png",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "发送红包",
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 底部 功能选项 单击事件<br/>
  /// 0 -- 充赠优惠<br/>
  /// 1 -- 我要请客<br/>
  /// 2 -- 发送红包
  onClickEvent(int tag, BuildContext context) {
    switch (tag) {
      case 0:
        Log.d(" 充赠优惠 ");
        Application.router.navigateTo(
          context,
          rechargePage,
          transition: TransitionType.inFromLeft,
        );

        break;
      case 1:
        Log.d(" 我要请客 ");

        break;
      case 2:
        Log.d(" 发送红包 ");

        break;
      default:
    }
  }
}
