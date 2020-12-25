import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

/// 选择登陆方式页面
class WechatLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBarCustom(
          backgroundColor: AppColors.appDividerColor,
          shadowColor: AppColors.appDividerColor,
          isShowDivider: false),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 46),
          child: Image.asset(
            "lib/assets/images/login/icon_login.webp",
            width: 58,
            height: 68,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text("luckin coffee"))
      ]),
    );
  }

  _onClickItem(type) {
    switch (type) {
      case 0: // 微信一键登录

        break;
      case 1: //手机验证码登录
        break;
    }
  }
}
/**
    Center(
    child: Image.asset(
    "lib/assets/images/login/icon_login.webp",
    width: 80,
    height: 94,
    fit: BoxFit.fill,
    ),
    )),
    Positioned(
    top: 236.0,
    right: 0.0,
    left: 0.0,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    AppButton(
    onTap: () => _onClickItem(0),
    text: "微信一键登录",
    width: 300,
    height: 44.0,
    backColor: AppColors.appTheme49c265,
    highlightColor: AppColors.appThemeHigh49c265,
    ),
    Padding(
    padding: const EdgeInsets.only(top: 25),
    child: AppButton(
    onTap: () => _onClickItem(1),
    text: "手机验证码登录",
    style: TextStyle(
    fontSize: 16.0,
    color: AppColors.appTheme88afd5,
    ),
    width: 300,
    height: 44.0,
    backColor: Colors.transparent,
    highlightColor: AppColors.appThemeHigh88afd5,
    ),
    )
    ],
    ),
    )
    ],
    ),
    );
 */
