import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String currAreaVal = "中国（+86）";
  int currAreaCode = 86;
  var editingPhone = TextEditingController();
  var editingCode = TextEditingController();

  var focusPhone = FocusNode();
  var focusCode = FocusNode();
  StreamSubscription _timerStream;
  final BuildContext context;

  LoginCubit(this.context) : super(LoginInitial()) {
    Future.delayed(Duration(seconds: 5)).then((_) {
      emit(LoginShowHint(true, hintMsg: "为了您的账号安全，请绑定手机"));
    });
    // Future.delayed(Duration.zero,(){});
    emit(CodeState(-1));
  }

  //  emit(LoginShowHint("短信验证码已下发至 $currAreaVal ${editingPhone.text}",true));

  /// 点击选择 跳转 选择手机 - 国家/区域
  onClickSelectArea() {
    // ignore: missing_return
    Routes.goPhoneAreaPage(context).then<String>((result) {
      currAreaVal = result["val"];
      currAreaCode = result["key"];
      emit(LoginChangPhoneArea(currAreaVal));
    });
  }

  /// 跳转至 用户服务条款 页面
  goTermsOfServicePage() {
    Routes.goTermsOfServicePage(context);
  }

  /// 提交按钮 点击事件
  onClickConfirm() {
    String errMsg = _checkFormData();
    if (errMsg != "" || errMsg.length > 0) {
      showToast(errMsg);
      _showHintWidget(true, errMsg: errMsg);
      return;
    }
  }

  /// 清空 手机号输入框 内容
  onClickClearPhoneNum() {
    editingPhone.text = "";
    _showHintWidget(false);
    emit(ClearPhoneNum(false));
  }

  /// 手机输入框 内容改变时间
  onChangedPhone(String entity) {
    if (entity.length > 1) return;
    emit(ClearPhoneNum(entity.length != 0));
  }

  /// 手机号输入框 软键盘 Action 点击事件
  changeFocusCode() {
    var phoneErr = _checkPhoneData();
    if (phoneErr == "")
      FocusScope.of(context).requestFocus(focusCode);
    else {
      showToast(phoneErr);
      _showHintWidget(true, errMsg: phoneErr);
    }
  }

  /// 该方法 请求 验证码 方法点击
  void onClickRequestCode() {
    var errMsg = _checkPhoneData();
    if (errMsg != "") {
      showToast(errMsg);
      _showHintWidget(true, errMsg: errMsg);
      return;
    }
    LoadingDialog.show(context);
    /// TODO 这里模拟请求网络发送 短信验证码的过程

    Future.delayed(
      Duration(seconds: 5),
    ).then((_) {
      LoadingDialog.cancel();
      _startDown();
    });
  }

  void _startDown() {
    emit(LoginShowHint(true,hintMsg:"短信验证码已下发至 ",errMsg:"$currAreaVal ${editingPhone.text}"));
    _timerStream = Stream.periodic(Duration(seconds: 1), (data) => data)
        .take(Global.CODE_TIMER_TICKS)
        .listen((event) {
      emit(CodeState(Global.CODE_TIMER_TICKS - event));
    }, onDone: () {
      emit(CodeState(-1));emit(LoginShowHint(true));
    });
  }

  String _checkFormData() {
    var phoneErr = _checkPhoneData();
    if (phoneErr != "") return phoneErr;
    if (editingCode.text == null || editingCode.text == "") {
      FocusScope.of(context).requestFocus(focusCode);
      return "验证码不能为空";
    }
    if (editingCode.text.length < 4) {
      FocusScope.of(context).requestFocus(focusCode);
      return "验证码格式不正确";
    }
    return "";
  }

  String _checkPhoneData() {
    if (editingPhone.text == null || editingPhone.text == "") {
      FocusScope.of(context).requestFocus(focusPhone);
      return "手机号不能为空";
    }
    if (!ValidatorUtil.isMobile(editingPhone.text)) {
      FocusScope.of(context).requestFocus(focusPhone);
      return "手机号格式不正确";
    }
    return "";
  }

  _showHintWidget(bool isShow, {String hintMsg, String errMsg}) {
    if (!isShow)
      emit(LoginShowHint(isShow));
    else {
      emit(LoginShowHint(isShow, hintMsg: hintMsg, errMsg: errMsg));
      Future.delayed(Duration(seconds: 5), () => emit(LoginShowHint(false)));
    }
  }

  @override
  Future<Function> close() {
    editingPhone.dispose();
    editingPhone = null;
    editingCode.dispose();
    editingCode = null;
    focusPhone.dispose();
    focusPhone = null;
    focusCode.dispose();
    focusCode = null;
    _timerStream?.cancel();
    _timerStream = null;
    return super.close();
  }
}
