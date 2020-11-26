import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit([BuildContext context]) : super(MainCurrentState(0));

  changeCurrentPage(int index) {
    if (index == 2) {
      // 这里判断 用户是否登录 ，
      var isLogin = false;
      if (!isLogin) {
        showToast("当前 用户未登录");
        return;
      }
    }

    emit(MainCurrentState(index));
  }
}
