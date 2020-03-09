import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/divider_widget.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/dimens.dart';
import 'package:luckin_coffee_demo/config/res/themes.dart';

///```
/// 该APP 通用tabBar
///```
class HeadTitleBar extends StatefulWidget implements PreferredSizeWidget {
  ///```
  /// appBar 中间显示的文字
  ///```
  final String title;

  ///```
  /// appBar 中间显示的文字样式
  ///```
  final TextStyle titleTextStyle;

  ///```
  /// appBar 高度
  ///```
  final double height;

  ///```
  /// appBar 背景颜色
  ///```
  final Color backageColor;

  ///```
  /// 是否显示 appBar 左边返回 按钮
  /// 默认为true
  ///```
  final bool isShowBack;

  ///```
  /// APPBar左边 单击事件
  /// 若不传，则默认实现返回上一个页面的功能
  ///```
  final VoidCallback leftCheck;

  ///````
  /// APPBar左边 显示的图片
  /// 默认显示 箭头返回键
  /// ```
  final Image backIcon;
  ///```
  /// APPBar 右侧显示的Widget
  /// 若不传，则默认不显示
  ///```
  final Widget rightWidget;

  ///```
  /// APPBar 右侧显示的Widget 单击事件
  /// 若不传，则默认实现 输出日志
  ///```
  final VoidCallback rightCheck;

  const HeadTitleBar({
    Key key,
    this.backIcon,
    this.title = "",
    this.titleTextStyle,
    this.height = appBarHeight,
    this.backageColor = Colors.white,
    this.isShowBack = false,
    this.leftCheck,
    this.rightWidget,
    this.rightCheck,
  }) : super(key: key);

  @override
  _HeadTitleBarState createState() => _HeadTitleBarState();

  @override
  Size get preferredSize => Size.fromHeight(this.height);
}

class _HeadTitleBarState extends State<HeadTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.widget.backageColor,
      height: this.widget.height + appStartHeight,
      child: SafeArea(
        top: true,
        child: Container(
          height: this.widget.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Stack(
                  children: <Widget>[
                    buildLeftWidget(),
                    buildTitle(),
                    buildRightWidget(),
                  ],
                ),
              ),
              DividerWidget()
            ],
          ),
        ),
      ),
    );
  }

  /// 创建中间的Title
  buildTitle() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: Center(
        child: Text(
          this.widget.title,
          style: this.widget.titleTextStyle ?? titleTextStyle,
        ),
      ),
    );
  }

  /// 创建左侧的 widget
  buildLeftWidget() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 0.0,
      child: Offstage(
        offstage: this.widget.isShowBack,
        child: Material(
          child: Ink(
            color: Colors.white,
            child: InkResponse(
              highlightColor: Colors.black12,
              highlightShape: BoxShape.rectangle,
              radius: 0.0,
              onTap: () {
                Log.d("  你点击了 返回按钮");
                if (this.widget.leftCheck == null)
                  Application.router.pop(this.context);
                else
                  this.widget.leftCheck();
              },
              child: Container(
                  width: this.widget.height,
                  height: this.widget.height,
                  alignment: Alignment.center,
                  child: this.widget.backIcon ?? buildDefault()),
            ),
          ),
        ),
      ),
    );
  }

  /// 创建又侧 widget
  buildRightWidget() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      right: 0.0,
      child: Offstage(
        offstage: this.widget.rightWidget == null,
        child: Material(
            child: Ink(
          color: Colors.white,
          child: InkResponse(
            highlightColor: Colors.black12,
            highlightShape: BoxShape.rectangle,
            radius: 0.0,
            onTap: () {
              Log.d("  你点击了 右侧按钮");
              if (this.widget.rightCheck != null)
                this.widget.rightCheck();
            },
            child: this.widget.rightWidget ?? Container(),
          ),
        )),
      ),
    );
  }

  buildDefault() {
    const String _defaultIconPath = "lib/assets/images/icon_left_back.png";
    return Image(
      image: AssetImage(_defaultIconPath),
      width: 16.0,
      height: 16.0,
      fit: BoxFit.fill,
      alignment: Alignment.center,
    );
  }
}
