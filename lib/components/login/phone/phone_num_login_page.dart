import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

/// 选择登陆方式页面
class PhoneNumLoginPage extends StatelessWidget {
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

  _buildSelectArea(BuildContext context) => FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

            // TODO 201226 将要构建 用户输入框
        return Container(constraints: constraints,child: Row(),);
      });

}
