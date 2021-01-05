part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
/// 控制显示 提示控件
class LoginShowHint extends LoginState {
  final String hintMsg ,errMsg;
  final bool isShow;
  LoginShowHint(this.isShow,{this.hintMsg,this.errMsg});
}
/// 控制是否显示 清除 按钮 是否显示
class ClearPhoneNum extends LoginState {
  final bool isClear;

  ClearPhoneNum(this.isClear);
}

class LoginChangPhoneArea extends LoginState {
  final String phoneArea;

  LoginChangPhoneArea(this.phoneArea);
}
