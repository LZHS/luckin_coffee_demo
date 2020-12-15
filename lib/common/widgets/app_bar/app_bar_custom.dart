import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';

/// 封装通用的 AppBar
// ignore: must_be_immutable
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  ///```
  /// appBar 高度
  ///```
  final double height;

  ///```
  /// appBar 背景颜色
  ///```
  final Color backgroundColor;

  /// appBar 遮罩层 背景颜色
  final Color shadowColor;

  /// 左侧Widget 是否为空 默认不为空
  final bool leftIsNull;
  final VoidCallback onClickLeft;
  final Widget leftWidget;
  final Widget centerWidget;
  final Widget rightWidget;

  /// 是否显示 分割线，默认显示
  final bool isShowDivider;
  BuildContext _context;
  final double leftWidth = 36.0;

  AppBarCustom(
      {Key key,
      this.height = appBarHeight,
      this.shadowColor = AppColors.appBarColor,
      this.backgroundColor = AppColors.appBarColor,
      this.leftIsNull = false,
      this.onClickLeft,
      this.leftWidget,
      this.centerWidget,
      this.rightWidget,
      this.isShowDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      width: double.infinity,
      height: height + Global.getStatusBarHeight(context) + 1,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: Global.getStatusBarHeight(context),
            color: shadowColor,
          ),
          Container(
            width: double.infinity,
            height: height - (isShowDivider ? 1 : 0),
            color: backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLeftWidget(),
              ],
            ),
          ),
          Visibility(visible: isShowDivider, child: DividerWidget())
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  /// 构建左侧 Widget
  _buildLeftWidget() {
    var widget = Container(
      width: leftWidth,
    );


    return widget;
  }
}
