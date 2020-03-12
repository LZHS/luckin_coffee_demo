import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';

///```
/// 用户登录， 选择登录方式页面
///```
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(),
      body: SafeArea(
        child: Material(
          color: Colors.white,
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
                top: 15.0,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 44.0,
                      margin: EdgeInsets.only(left: 38.0, right: 38.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Color(0xff49c265),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: InkResponse(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          splashColor: Color(0xAAC9EEC2),
                          highlightShape: BoxShape.rectangle,
                          containedInkWell: true,
                          onTap: goWeChatLogin,
                          child: Center(
                            child: Text(
                              "微信一键登录",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 44.0,
                      margin:
                          EdgeInsets.only(left: 38.0, right: 38.0, top: 25.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border:
                              Border.all(color: Color(0xff88afd5), width: 1.0),
                        ),
                        child: InkResponse(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          splashColor: Color(0x9988afd5),
                          highlightShape: BoxShape.rectangle,
                          containedInkWell: true,
                          onTap: goPhoneCode,
                          child: Center(
                            child: Text(
                              "手机验证码登录",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff88afd5),
                              ),
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
      ),
    );
  }

  goPhoneCode() {
    Log.d("手机验证码登录");
    Application.router.navigateTo(
        context, loginPhoneCode + "?isDeficiencyNum=false",
        transition: TransitionType.inFromRight);
  }

  goWeChatLogin() {
    Log.d("跳转至为微信登录页面");
  }
}
