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
          isShowDivider: false,
          leftWidget: _buildLeftWidget(context),
        ),
        body: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            top: 46,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/login/icon_login.webp",
                  width: 58,
                  height: 68,
                  fit: BoxFit.fill,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "luckin coffee",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
          Positioned(
            top: 180,
            left: 33,
            right: 33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DividerWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "登录后开发者将获得以下权限",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "▪  获得你的公开信息（昵称、头像、地区等）",
                    style: TextStyle(
                        fontSize: 16.0, color: AppColors.appSubTitleColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: AppButton(
                    onTap: () {
                      showToast("该功能尚未开放");
                    },
                    text: "确认登录",
                    width: 290,
                    height: 44.0,
                    backColor: AppColors.appTheme49c265,
                    highlightColor: AppColors.appThemeHigh49c265,
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  _buildLeftWidget(BuildContext context) => SizedBox(
        width: 62,
        height: double.infinity,
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(color: Colors.transparent),
            child: InkResponse(
              highlightColor: AppColors.appBackColor,
              highlightShape: BoxShape.rectangle,
              onTap: () => Application.router.pop(context),
              child: Center(
                child: Text(
                  "取消",
                  style:
                      TextStyle(fontSize: 16, color: AppColors.appTitleColor),
                ),
              ),
            ),
          ),
        ),
      );
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
