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
                  buildWhen: (_, current) => current is LoginShowHint,
                  builder: (_, state) {
                    if (state is LoginShowHint)
                      return Positioned(
                          top: 134,
                          left: 0.0,
                          right: 0.0,
                          child: Center(
                              child: Text(
                            "为了您的账号安全，请绑定手机",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.appTipsTextColor),
                          )));
                    return Container();
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
  static const double marginLeft=38.0,marginRight=38.0;
  /// 输入框限制
  final constraints = BoxConstraints(
      minWidth: double.infinity,
      maxWidth: double.infinity,
      minHeight: 58.0,
      maxHeight: 58.0);
  final hintStyle = TextStyle(fontSize: 14, color: AppColors.appHintTextColor);

  @override
  Widget build(BuildContext context) {
    _cubit=BlocProvider.of<LoginCubit>(context);
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
                buildWhen: (_, current) => current is LoginChangPhoneArea,
                builder: (context, state) {
                  if (state is LoginChangPhoneArea)
                    return Text(
                      state.phoneArea,
                      style: TextStyle(
                          fontSize: 14, color: AppColors.appTitleColor),
                    );
                  return Container();
                },
              ),
            ),
          ],
        )),
      );

  _buildInputPhone() => _customContainer(TextField(
        maxLength: null,
        controller: _cubit.editingPhone,
        focusNode: _cubit.focusPhone,
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
      ));

  _buildInputCode() => _customContainer(TextField(
    controller: _cubit.editingCode,
        focusNode:_cubit.focusCode ,
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
        decoration: InputDecoration(
          hintText: "请输入手机验证码",
          hintStyle: hintStyle,
          border: InputBorder.none,
        ),
      ));

  /// item 基本 属性包装
  _customContainer(Widget child) => Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("点击确定，即表示以阅读并同意",
                    style: TextStyle(
                        fontSize: 12.0, color: AppColors.appSubTitleColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text("《注册会员服务条款》",
                      style: TextStyle(
                          fontSize: 12.0, color: AppColors.appTipsTextColor)),
                )
              ],
            ),
          ));
}


