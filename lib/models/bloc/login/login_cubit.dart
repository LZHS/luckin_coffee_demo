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
  final BuildContext context;

  LoginCubit(this.context) : super(LoginInitial()) {
    Future.delayed(Duration(seconds: 5), () {
      emit(LoginShowHint(true, hintMsg: "为了您的账号安全，请绑定手机"));
    });
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
      emit(LoginShowHint(true, errMsg: errMsg));
      return;
    }
  }

  /// 清空 手机号输入框 内容
  onClickClearPhoneNum() {
    editingPhone.text = "";
    emit(ClearPhoneNum(false));
  }

  /// 手机输入框 内容改变时间
  onChangedPhone(String entity) {
    if (entity.length > 1) return;
    emit(ClearPhoneNum(entity.length != 0));
  }

  String _checkFormData() {
    if (editingPhone.text == null || editingPhone.text == "") {
      FocusScope.of(context).requestFocus(focusPhone);
      return "手机号不能为空!";
    }
    if (!ValidatorUtil.isMobile(editingPhone.text)) {
      FocusScope.of(context).requestFocus(focusPhone);
      return "手机号格式不正确!";
    }

    if (editingCode.text == null || editingCode.text == "") {
      FocusScope.of(context).requestFocus(focusCode);
      return "验证码不能为空!";
    }
    if (editingCode.text.length < 4) {
      FocusScope.of(context).requestFocus(focusCode);
      return "验证码格式不正确!";
    }
    return "";
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
    return null;
  }
}
