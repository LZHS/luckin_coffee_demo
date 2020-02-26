import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/divider_widget.dart';
import 'package:flutter_demo/config/application.dart';
import 'package:flutter_demo/config/res/dimens.dart';
import 'package:flutter_demo/config/res/themes.dart';

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

  const HeadTitleBar({
    Key key,
    this.title,
    this.titleTextStyle,
    this.height = appBarHeight,
    this.backageColor = Colors.white,
    this.isShowBack = false,
    this.leftCheck,
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
                  alignment: Alignment.center,
                  children: <Widget>[
                    Text(
                      this.widget.title,
                      style: this.widget.titleTextStyle ?? titleTextStyle,
                    ),
                    Offstage(
                      offstage: this.widget.isShowBack,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
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
                                  child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/icon_left_back.png"),
                                    width: 16.0,
                                    height: 16.0,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
}
