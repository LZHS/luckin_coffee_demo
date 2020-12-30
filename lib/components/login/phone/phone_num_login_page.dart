import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

/// 手机号登录页面
class PhoneNumLoginPage extends StatelessWidget {
  LoginCubit _login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBarCustom(isShowDivider: false),
      body: BlocProvider<LoginCubit>(
        create: (_) =>LoginCubit(),
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
            Positioned(
              top: 177.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectArea()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

const constraints = BoxConstraints(
    minWidth: double.infinity,
    maxWidth: double.infinity,
    minHeight: 58.0,
    maxHeight: 58.0);

/// 选择 国家/地区
class SelectArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>FlatButton(
      padding: const EdgeInsets.all(0),
      onPressed: () =>
          BlocProvider.of<LoginCubit>(context).onClickSelectArea(context),
      child: Container(
        constraints: constraints,
        padding: const EdgeInsets.only(left: 38, right: 38),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "选择国家/地区",
                        style: TextStyle(
                            color: AppColors.appSubTitleColor, fontSize: 14),
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
                  ),
                )),
            DividerWidget()
          ],
        ),
      ));
}