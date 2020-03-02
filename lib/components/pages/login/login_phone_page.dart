import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/divider_widget.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 手机验证码登录 页面
class LoginPhonePage extends StatefulWidget {
  final String isDeficiencyNum;

  LoginPhonePage({this.isDeficiencyNum});

  @override
  _LoginPhonePageState createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  List chooseAris = [" 中国 ", "+86"];

  ///TODO 构建 输入以及单击逻辑
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildIcon(),
                  buildHint(),
                  buildFromBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildFromBody() {
    return Container(
      margin: EdgeInsets.only(top: 23.0, left: 38.0, right: 38.0),
      child: Column(children: <Widget>[
        Container(
          height: 60.0,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Ink(
                  child: InkResponse(
                    highlightColor: Color(0xfff2f2f2),
                    highlightShape: BoxShape.rectangle,
                    radius: 0.0,
                    onTap: goChooseAri,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text(
                              "选择国家/地区",
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 14.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                  "${chooseAris.elementAt(0)} (${chooseAris.elementAt(1)})",
                                  style: TextStyle(
                                      color: appBarTitleColor, fontSize: 14.0)),
                            ),
                          ]),
                          Image.asset(
                            "lib/assets/images/login/icon_login_back.png",
                            width: 14.0,
                            height: 14.0,
                          ),
                        ]),
                  ),
                ),
              ),
              DividerWidget()
            ],
          ),
        ),
        Container(
          height: 60.0,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "请输入手机号",
                    labelStyle:
                        TextStyle(fontSize: 14.0, color: Color(0xffa6a6a6)),
                    prefixText: "${chooseAris.elementAt(1)}",
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  maxLength: null,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(11)
                  ],
                ),
              )),
              DividerWidget(),
            ],
          ),
        ),
        Container(
          height: 60.0,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "请输入手机验证码",
                    labelStyle:
                        TextStyle(fontSize: 14.0, color: Color(0xffa6a6a6)),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  maxLength: null,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(6)
                  ],
                ),
              )),
              DividerWidget(),
            ],
          ),
        ),
        Container(
          height: 60.0,
          margin: EdgeInsets.only(top: 10.0),
          alignment: Alignment.center,
          child: Material(
            child: Ink(
              decoration: BoxDecoration(
                  color: Color(0xff88afd5),
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: InkResponse(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                splashColor: Color(0xff88afd5),
                highlightShape: BoxShape.rectangle,
                containedInkWell: true,
                onTap: confirmLogin,
                child: Container(
                  height: 40.0,
                  alignment: Alignment.center,
                  child: Text(
                    "确定",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: checkTermsOfService,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text(
                  "点击确定，即表示以阅读并同意",
                  style: TextStyle(fontSize: 12.0, color: Color(0xff808080)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "《注册会员服务条款》",
                    style: TextStyle(fontSize: 12.0, color: Color(0xff557a9d)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 120.0,
        )
      ]),
    );
  }

  Container buildHint() {
    return Container(
      margin: EdgeInsets.only(top: 14.0),
      child: Visibility(
        visible: this.widget.isDeficiencyNum == "false",
        child: Text(
          "为了您的账号安全，请绑定手机",
          style: TextStyle(
            color: Color(0xff55799d),
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Container buildIcon() {
    return Container(
      margin: EdgeInsets.only(top: 26.0),
      child: Image.asset(
        "lib/assets/images/login/icon_login.png",
        width: 80.0,
        height: 94.0,
        fit: BoxFit.contain,
      ),
    );
  }

  /// 点击服务条款
  checkTermsOfService() {
    Log.d("点击服务条款");
  }

  /// 確認 登錄 按鈕單機事件
  confirmLogin() {
    Log.d("確認 登錄 按鈕單機事件");
  }

  ///选择国家/地区
  goChooseAri() {
    Log.d("选择国家/地区");
  }
}
