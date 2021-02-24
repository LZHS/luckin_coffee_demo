import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final BuildContext context;

  MainCubit(this.context) : super(MainCurrentState(0));

  changeCurrentPage(int index) {
    if (index == 2 && !UserInfo().isLogin) {
      Routes.goLoginPage(context);
      return;
    }
    emit(MainCurrentState(index));
  }
}
