import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  ///```
  /// appBar 高度
  ///```
  final double height;

  ///```
  /// appBar 背景颜色
  ///```
  final Color backageColor;

  const AppBarCustom(
      {Key key,
      this.height = appBarHeight,
      this.backageColor = AppColors.appBarColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height + Global.getStatusBarHeight(context),
      color: backageColor,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: height,
        color: Colors.red,
        child: Text("1234 "),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
