import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

part 'down_state.dart';

class DownCubit extends Cubit<DownState> {
  TransitionsCubit transitionsCubit;
  StreamSubscription subscription;

  DownCubit(this.transitionsCubit) : super(DownState()){
    subscription=transitionsCubit.listen((state) {

    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
