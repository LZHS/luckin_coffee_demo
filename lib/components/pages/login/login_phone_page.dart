import 'package:flutter/material.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';

///```
///手机验证码登录 页面
///```
class LoginPhonePage extends StatefulWidget {
  bool isDeficiency;
  LoginPhonePage({String isDeficiencyNum}) {
    this.isDeficiency = isDeficiencyNum == null;
  }
  @override
  _LoginPhonePageState createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 26.0,
              left: 0.0,
              right: 0.0,
              child: Image.asset(
                "lib/assets/images/login/icon_login.png",
                width: 80.0,
                height: 94.0,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 134.0,
              left: 0.0,
              right: 0.0,
              child: Visibility(
                visible: !this.widget.isDeficiency,
                child: Center(
                  child: Text(
                    "为了您的账号安全，请绑定手机",
                    style: TextStyle(
                      color: Color(0xff55799d),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                /// TODO 手机验证码登录 页面 未完成
              ),
            ),
          ],
        ),
      ),
    );
  }
}
