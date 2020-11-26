import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  StreamSubscription<int> _tickerSubscription;
  final BuildContext context;

  TransitionsCubit transitionsCubit;

  StreamSubscription subscription;

  TimerCubit(this.context) : super(0) {
    transitionsCubit=context.read<TransitionsCubit>();
    subscription=transitionsCubit.listen((_) { });
    timerStarted();
  }

  timerStarted() async {
    _tickerSubscription?.cancel();
    _tickerSubscription = _tick(ticks: Global.TIMER_TICKS).listen((duration) {
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
    transitionsCubit.goHome();
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    subscription?.cancel();
    return super.close();
  }

  Stream<int> _tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
