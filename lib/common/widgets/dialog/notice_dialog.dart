import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';

// ignore: must_be_immutable
class NoticeDialog extends Dialog {
  final AppNoticeInfo noticeInfo;
  final VoidCallback onTap;
  DateTime _lastPressedAt; //上次点击时间

  NoticeDialog({@required this.noticeInfo, this.onTap})
      : assert(noticeInfo != null);
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

  _buildActionWidget() => Container(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            alignment: Alignment.center,
            child: AppButton(
              text: "知道了",
              width: 130,
              onTap: () {
                Navigator.of(context).pop();
                onTap?.call();
              },
            )
      );

  _buildContentWidget() => ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: double.infinity, minHeight: 100.0, maxHeight: 260.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Text(
              "${_buildNoticeContext(noticeInfo.noticeInfo)}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  fontSize: 13.0,
                  color: AppColors.appTextColor),
            ),
          ),
        ),
      );

  _buildTitleWidget() => Container(
        padding: const EdgeInsets.only(top: 18.0, bottom: 14.0),
        child: Text(
          "公 告",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: AppColors.appTitleColor),
        ),
      );

  String _buildNoticeContext(noticeInfo) {
    List<String> arr=noticeInfo.split(RegExp("<br/>"));
    String result="";
    arr.forEach((element)=> result+="\n$element");
    return result;

  }
}
