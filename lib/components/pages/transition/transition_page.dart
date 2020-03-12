import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';

///```
/// APP 的第一个页面 ，用于展示过度页面
/// ```
class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  Timer _timer;
  int count = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              child: Image.asset(
                "lib/assets/images/icon_transition.png",
                fit: BoxFit.cover,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Align(
              alignment: FractionalOffset.topRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
                child: FlatButton(
                  onPressed: () => navigationPage(),
                  color: Colors.grey,
                  child: Text(
                    "$count 跳过广告",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 1);
    Timer(_duration, () {
      _timer = Timer.periodic(const Duration(seconds: 1), (v) {
        count--;
        if (count == 0)
          navigationPage();
        else
          setState(() {});
      });
      return _timer;
    });
  }

  void navigationPage() {
    _timer.cancel();
    Application.router.navigateTo(
      context,
      "$home?message=过度页面传递的数据",
      replace: true,
      transition: TransitionType.inFromRight,
    ); //要跳转的页面
  }
}
