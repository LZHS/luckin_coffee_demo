import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _defaultArea = "中国（+86）";

  LoginCubit() : super(LoginInitial()) {
    emit(LoginChangPhoneArea(_defaultArea));
  }

  onClickSelectArea(BuildContext context) {
    // ignore: missing_return
    Routes.goPhoneAreaPage(context).then<String>((result) {
      emit(LoginChangPhoneArea(result));
    });
  }
}
