import 'package:bloc/bloc.dart';
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
    emit(LoginChangPhoneArea(currAreaVal));
    Future.delayed(Duration(seconds: 5), () {
      emit(LoginShowHint());
    });
  }

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

  ///
  onClickConfirm() {
    if (editingPhone.text == null || editingPhone.text == "") {
      FocusScope.of(context).requestFocus(focusPhone);
      showToast("手机号不能为空");
      return;
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
    return null;
  }
}
