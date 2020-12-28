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
  /// 朱勇设置为true是，leftWidget 其他设置将无效
  final bool leftIsNull;
  final VoidCallback onClickLeft;
  final SizedBox leftWidget;
  final Widget leftImageWidget;
  final String title;

  static const TextStyle _defaultTitleTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: AppColors.appTitleColor);
  final TextStyle titleTextStyle;
  final Widget centerWidget;
  final SizedBox rightWidget;

  /// 是否显示 分割线，默认显示
  final bool isShowDivider;
  BuildContext _context;
  static double leftWidth = 36.0;

  AppBarCustom(
      {Key key,
      this.height = appBarHeight,
      this.shadowColor = AppColors.appBarColor,
      this.backgroundColor = AppColors.appBarColor,
      this.leftIsNull = true,
      this.onClickLeft,
      this.leftWidget,
      this.leftImageWidget,
      this.title,
      this.titleTextStyle = _defaultTitleTextStyle,
      this.centerWidget,
      this.rightWidget,
      this.isShowDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Global.getStatusBarHeight(context),
          color: shadowColor,),
        Container(
          width: double.infinity,
          height: height,
          color: backgroundColor,
          child: Stack(
            children: [
              _buildLeftWidget(),
              _buildCenterWidget(),
              _buildRightWidget(),
            ],
          ),
        ),
        Visibility(visible: isShowDivider, child: DividerWidget())
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height + (isShowDivider ? 1 : 0));

  /// 构建左侧 Widget
  _buildLeftWidget() =>
      !this.leftIsNull ? Container() : Positioned(
          left: 0.0,
          top: 0.0,
          bottom: 0.0,
          width: leftWidget == null ? leftWidth : leftWidget.width,
          child: _buildLeftChildWidget()
      );

  _buildLeftChildWidget() =>
      leftWidget ?? Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.transparent
          ),
          child: InkResponse(
            highlightColor: AppColors.appBackColor,
            highlightShape: BoxShape.rectangle,
            onTap: _onClickListener,
            child: Center(
              child: leftImageWidget ?? _buildLeftImageWidget(),
            ),
          ),
        ),
      );

  _buildLeftImageWidget() =>
      Image(
        image: AssetImage("lib/assets/images/icon_left_back.webp"),
        width: 16.0,
        height: 16.0,
        fit: BoxFit.fill,
        alignment: Alignment.center,
      );

  _onClickListener() {
    if (onClickLeft != null)
      onClickLeft.call();
    else
      Application.router.pop(_context);
  }

  /// 构建中间的文字
  _buildCenterWidget() {
    if (centerWidget == null && title == null || title == "")
      return Container();
    var paddingLeft = (leftWidget == null ? leftWidth : leftWidget.width) +
        leftWidth / 2;
    var paddingRight = (rightWidget == null ? 0 : rightWidget.width) +
        leftWidth / 2;
    return Positioned(
      left: paddingLeft,
      right: paddingRight,
      top: 0,
      bottom: 0,
      child: centerWidget ??
          Center(
            child: Text(
              this.title,
              overflow: TextOverflow.ellipsis,
              style: this.titleTextStyle,
            ),
          ),
    );
  }

  /// 添加右侧 控件
  _buildRightWidget() => rightWidget == null
      ? Container()
      : Positioned(
          top: 0.0,
          bottom: 0.0,
          width: rightWidget.width,
          right: 0.0,
          child: rightWidget);
}
