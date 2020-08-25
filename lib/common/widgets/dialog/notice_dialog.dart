import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';

class NoticeDialog extends Dialog {
  final AppNoticeInfo noticeInfo;
  DateTime _lastPressedAt; //上次点击时间

  NoticeDialog({@required this.noticeInfo}) : assert(noticeInfo != null);
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      onWillPop: _onNavigationClickEvent,
      child: Material(
        type: MaterialType.transparency,
        child: _buildContentView(),
      ),
    );
  }

  Future<bool> _onNavigationClickEvent() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
      //两次点击间隔超过1秒则重新计时
      _lastPressedAt = DateTime.now();
      showToast('再按一次 Back 按钮退出');
      return Future.value(false);
    }
    closeApp();
    return Future.value(true);
  }

  Future<void> closeApp() async {
    await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }

  _buildContentView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          margin: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildTitleWidget(),
              DividerWidget(),
              _buildContentWidget(),
              _buildActionWidget()
            ],
          ),
        ),
      ),
    );
  }

  _buildActionWidget() => Visibility(
//    visible: noticeInfo.enabledStatus,
        visible: true,
        child: Container(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          alignment: Alignment.center,
          child: Material(
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: InkResponse(
                borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
                highlightColor: Colors.purple[800],
                //点击或者toch控件高亮的shape形状
                highlightShape: BoxShape.rectangle,
                //.InkResponse内部的radius这个需要注意的是，我们需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
                //水波纹的半径
                radius: 0.0,
                //水波纹的颜色 设置了highlightColor属性后 splashColor将不起效果
                splashColor: Colors.red,
                //true表示要剪裁水波纹响应的界面 false不剪裁 如果控件是圆角不剪裁的话水波纹是矩形
                containedInkWell: true,
                onTap: () {
                  print('click');
                },
                child: new Container(
                  //不能在InkResponse的child容器内部设置装饰器颜色，否则会遮盖住水波纹颜色的，containedInkWell设置为false就能看到是否是遮盖了。
                  width: 300.0,
                  height: 50.0,
                  //设置child 居中
                  alignment: Alignment(0, 0),
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  _buildContentWidget() => ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: double.infinity, minHeight: 100.0, maxHeight: 260.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Text(
              "${noticeInfo.noticeInfo}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: AppColors.appTextColor),
            ),
          ),
        ),
      );

  _buildTitleWidget() => Container(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Text(
          "公 告",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: AppColors.appTitleColor),
        ),
      );
}
