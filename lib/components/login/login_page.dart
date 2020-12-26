import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

/// 选择登陆方式页面
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBarCustom(isShowDivider: false),
      body: Stack(
        children: [
          Positioned(
              top: 26,
              right: 0.0,
              left: 0.0,
              child: Center(
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
                  onTap: () => _onClickItem(0, context),
                  text: "微信一键登录",
                  width: 300,
                  height: 44.0,
                  backColor: AppColors.appTheme49c265,
                  highlightColor: AppColors.appThemeHigh49c265,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: AppButton(
                    onTap: () => _onClickItem(1, context),
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
  }

  _onClickItem(type, context) {
    switch (type) {
      case 0: // 微信一键登录
        Routes.goWechatLoginPage(context);
        break;
      case 1: //手机验证码登录
        Routes.goPhoneLoginPage(context);
        break;
    }
  }
}
