import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/divider_widget.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
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
  final FocusNode phoneFocus = FocusNode();
  final FocusNode codeFocus = FocusNode();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  ///TODO 构建 输入以及单击逻辑
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(title: "验证码登陆"),
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
          child: Ink(
            child: InkResponse(
              highlightColor: Color(0xfff2f2f2),
              highlightShape: BoxShape.rectangle,
              radius: 0.0,
              onTap: goChooseArea,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        "选择国家/地区",
                        style:
                            TextStyle(color: Color(0xff808080), fontSize: 14.0),
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
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xfff2f2f2),
                width: 1.0,
              ),
            ),
          ),
        ),
        Container(
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "请输入手机号",
              labelStyle: TextStyle(fontSize: 14.0, color: Color(0xffa6a6a6)),
              prefixText: "${chooseAris.elementAt(1)}",
            ),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            maxLength: null,
            autofocus: true,
            autocorrect: true,
            focusNode: phoneFocus,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(11)
            ],
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(codeFocus),
            controller: phoneController,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xfff2f2f2),
                width: 1.0,
              ),
            ),
          ),
        ),
        Container(
          height: 60.0,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "请输入手机验证码",
              labelStyle: TextStyle(fontSize: 14.0, color: Color(0xffa6a6a6)),
            ),
            keyboardType: TextInputType.number,
            focusNode: codeFocus,
            textInputAction: TextInputAction.done,
            autocorrect: true,
            maxLines: 1,
            maxLength: null,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(6)
            ],
            onEditingComplete: onFinishCode,
            controller: codeController,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xfff2f2f2),
                width: 1.0,
              ),
            ),
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

  /// 输入code 键盘上 done 按钮单击事件
  onFinishCode() {
    String phone = phoneController.text;
    String code = codeController.text;
    if (!ValidatorUtil.isChinaPhoneLegal(phone)) {
      FocusScope.of(context).requestFocus(phoneFocus);
      showToast("请输入正确的手机号");
      return;
    }
    if (!ValidatorUtil.isVerificationCode(code)) {
      FocusScope.of(context).requestFocus(codeFocus);
      showToast("请输入正确的手机验证码");
      return;
    }

    ///TODO 这里将要做登陆操作
    Log.d("手机号：$phone");
    Log.d("验证码：$code");

    // 收起 软键盘
    phoneFocus.unfocus();
    codeFocus.unfocus();
  }

  /// 点击服务条款
  checkTermsOfService() {
    Log.d("点击服务条款");
    Application.router.navigateTo(context, termsOfService,
        transition: TransitionType.inFromLeft);
  }

  /// 確認 登錄 按鈕單機事件
  confirmLogin() {
    Log.d("確認 登錄 按鈕單機事件");
    onFinishCode();
  }

  ///选择国家/地区
  goChooseArea() {
    Log.d("选择国家/地区");
    Application.router
        .navigateTo(context, chooseAreaPage,
            transition: TransitionType.inFromLeft)
        .then((result) {
      if (result != null && result.length == 2)
        setState(() => chooseAris = result);
    });
  }
}
