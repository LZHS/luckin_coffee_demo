import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';

class TestDialogWidget extends StatefulWidget {
  TestDialogWidget({Key key}) : super(key: key);

  @override
  _TestDialogWidgetState createState() => _TestDialogWidgetState();
}

class _TestDialogWidgetState extends State<TestDialogWidget> {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          showToast("再按一次退出");
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        appBar: HeadTitleBar(
          title: "对话框 测试",
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Log.d("显示 loding 对话框");
                  },
                  child: Text("显示 loding 对话框"),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: this.context,
                        builder: (BuildContext context) {
                          return Container(
                            color: Colors.yellow,
                            width: 50.0,
                            height: 50.0,
                          );
                        });
                  },
                  child: Text("显示 loding 对话框"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
