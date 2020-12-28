import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

/// 手机号登录页面
class PhoneNumLoginPage extends StatelessWidget {
  Future<String> navigateRes;

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
            top: 177.0,
            right: 38.0,
            left: 38.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSelectArea(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  final constraints = BoxConstraints(
      minWidth: double.infinity,
      maxWidth: double.infinity,
      minHeight: 58.0,
      maxHeight: 58.0);

  _buildSelectArea(BuildContext context) => GestureDetector(
      onTap: () => onClickSelectArea(context),
      child: Container(
        constraints: constraints,
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "选择国家/地区",
                    style: TextStyle(
                        color: AppColors.appSubTitleColor, fontSize: 14),
                  ),
                  FutureBuilder<String>(
                    initialData: "中国（+86）",
                    future: navigateRes,
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      log.d("FutureBuilder => ${snapshot.toString()}");
                      return Text(
                        snapshot.data,
                        style: TextStyle(
                            fontSize: 14, color: AppColors.appTitleColor),
                      );
                    },
                  ),
                ],
              ),
            )),
            DividerWidget()
          ],
        ),
      ));

  onClickSelectArea(BuildContext context) {
    navigateRes =
        Future.delayed(Duration.zero, () => Routes.goPhoneAreaPage(context));
  }
}
