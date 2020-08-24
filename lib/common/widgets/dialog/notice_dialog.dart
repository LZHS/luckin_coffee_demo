import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';

class NoticeDialog extends Dialog {
  final AppNoticeInfo noticeInfo;

  NoticeDialog({@required this.noticeInfo}) : assert(noticeInfo != null);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _onNavigationClickEvent();
        return Future.value(false);
      },
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(onTap: _onNavigationClickEvent),
            _buildContentView(), //构建具体的对话框布局内容
          ],
        ),
      ),
    );
  }

  void _onNavigationClickEvent() {}

  _buildContentView() {
    return Container();
  }
}
