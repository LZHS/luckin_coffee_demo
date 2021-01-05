import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

/// 手机号登录页面
class PhoneNumLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = Global.getMediaSize(context);
    return Scaffold(
      appBar: AppBarCustom(isShowDivider: false),
      body: BlocProvider<LoginCubit>(
        lazy: false,
        create: (_) => LoginCubit(context),
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height - Global.getStatusBarHeight(context) - 100,
            child: Stack(
              children: [
                Positioned(
                    top: 26,
                    right: 0.0,
                    left: 0.0,
                    child: Center(
                      child: Image.asset(
                        "lib/assets/images/login/icon_login.webp",
                        width: 80,
                        height: 94,
                        fit: BoxFit.fill,
                      ),
                    )),
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (_, current) {
                    var temp = current is LoginShowHint;
                    return temp;
                  },
                  builder: (_, state) {
                    var visible = false;
                    if (state is LoginShowHint) visible = state.isShow;
                    return Visibility(
                        visible: visible,
                        child: Positioned(
                            top: 150,
                            left: 0.0,
                            right: 0.0,
                            child: Center(
                                child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: ((state is LoginShowHint)
                                    ? state.hintMsg
                                    : "")+"  ",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.appTipsTextColor),
                              ),
                                  TextSpan(
                                    text: (state is LoginShowHint)
                                        ? state.errMsg
                                        : "",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.appThemeSpecialff6464),
                                  )
                            ])))));
                  },
                ),
                Positioned(
                    top: 177.0,
                    left: 0.0,
                    right: 0.0,
                    child: InputContentWidget())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 中部主要操作 控件
// ignore: must_be_immutable
class InputContentWidget extends StatelessWidget {
  LoginCubit _cubit;
  static const double marginLeft = 38.0,
      marginRight = 38.0,
      height = 58.0;

  /// 输入框限制
  final constraints = BoxConstraints(
      minWidth: double.infinity,
      maxWidth: double.infinity,
      minHeight: height,
      maxHeight: height);
  final hintStyle = TextStyle(fontSize: 14, color: AppColors.appHintTextColor);

  @override
  Widget build(BuildContext context) {
    _cubit = BlocProvider.of<LoginCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSelectAreaWidget(context),
        _buildInputPhone(),
        _buildInputCode(),
        _buildConfirmWidget(),
        _buildTermsOfServiceWidget()
      ],
    );
  }

  /// 选择 国家/地区
  _buildSelectAreaWidget(context) => FlatButton(
        padding: const EdgeInsets.all(0),
        onPressed: () =>
            BlocProvider.of<LoginCubit>(context).onClickSelectArea(),
        child: _customContainer(Row(
          children: [
            Text(
              "选择国家/地区",
              style: TextStyle(color: AppColors.appSubTitleColor, fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (_, curr) => curr is LoginChangPhoneArea,
                builder: (context, state) {
                  var areaStr = this._cubit.currAreaVal;
                  if (state is LoginChangPhoneArea) areaStr = state.phoneArea;
                  return Text(
                    areaStr,
                    style: TextStyle(
                        fontSize: 14, color: AppColors.appTitleColor),
                  );
                },
              ),
            ),
          ],
        )),
  );

  /// 构建输入 手机号
  _buildInputPhone() =>
      _customContainer(Row(
        children: [
          Expanded(
              child: TextField(
                maxLength: null,
                controller: _cubit.editingPhone,
                focusNode: _cubit.focusPhone,
                onChanged: _cubit.onChangedPhone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                maxLines: 1,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "请输入手机号",
                  hintStyle: hintStyle,
                  border: InputBorder.none,
                ),
              )), BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (_, currState) => currState is ClearPhoneNum,
              builder: (_, state) {
                var visible = false;
                if (state is ClearPhoneNum)
                  visible = state.isClear;
                return Visibility(
                    visible: visible,
                    child: SizedBox(width: height,
                        height: height,
                        child: FlatButton(
                          onPressed: () => _cubit.onClickClearPhoneNum(),
                          child: Icon(Icons.cancel, size: 18,
                            color: AppColors.appHintTextColor,),)));
              })
        ],
      ));

  /// 构建 输入 验证码
  _buildInputCode() =>
      _customContainer(
          Row(
              children: [
                Expanded(child: TextField(
                  controller: _cubit.editingCode,
                  focusNode: _cubit.focusCode,
                  maxLength: null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  onEditingComplete: () => _cubit.onClickConfirm(),
                  decoration: InputDecoration(
                    hintText: "请输入手机验证码",
                    hintStyle: hintStyle,
                    border: InputBorder.none,
                  ),
                )),

              ]));

  /// item 基本 属性包装
  _customContainer(Widget child) =>
      Container(
        constraints: constraints,
        padding: const EdgeInsets.only(left: marginLeft, right: marginRight),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.centerLeft,
                  // TODO 增加一键删除清空数据按钮
                  child: child,
                )),
            DividerWidget()
          ],
        ),
  );

  /// 确认按钮
  _buildConfirmWidget() =>
      Container(
          margin:
          const EdgeInsets.only(top: 19, left: marginLeft, right: marginRight),
          width: double.infinity,
          child: AppButton(
            text: "确定",
            onTap: () => _cubit.onClickConfirm(),
            backColor: AppColors.appTheme88afd5,
          ));

  /// 创建用户协议 控件
  _buildTermsOfServiceWidget() =>
      FlatButton(
          color: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => _cubit.goTermsOfServicePage(),
          child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "点击确定，即表示以阅读并同意  ",
                        style: TextStyle(
                            fontSize: 12.0, color: AppColors.appSubTitleColor)),
                    TextSpan(text: "《注册会员服务条款》",
                        style: TextStyle(
                            fontSize: 12.0, color: AppColors.appTipsTextColor))
                  ]))


          ));
}


