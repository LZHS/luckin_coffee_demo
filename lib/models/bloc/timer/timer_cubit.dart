import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class TimerCubit extends Cubit<int> {
  static const _TICKS = 45;
  StreamSubscription<int> _tickerSubscription;
  final BuildContext context;

  TimerCubit(this.context) : super(0) {
    timerStarted();
  }

  timerStarted() async {
    _tickerSubscription?.cancel();
    _tickerSubscription = _tick(ticks: _TICKS).listen((duration) {
      // 正在计时
      emit(duration);
    }, onDone: () {
      // 计时结束
      timerComplete();
    });
  }

  timerComplete() {
    _tickerSubscription?.cancel();
    emit(0);
    Routes.goMainPage(context);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<int> _tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
