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
/// 控制 短信验证码的 请求， 以及倒计时
class CodeState extends LoginState{
  /// 当前显示 倒计时时间，
  /// 默认为 -1
  /// 范围 0s ~ Global.CODE_TIMER_TICKS（60s）
  final int currTimer;

  CodeState(this.currTimer);
}


class LoginChangPhoneArea extends LoginState {
  final String phoneArea;

  LoginChangPhoneArea(this.phoneArea);
}
