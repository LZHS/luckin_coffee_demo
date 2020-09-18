import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;

  HomeBloc(this.context)
      : assert(context != null),
        super(HomeInitial()){
    add(RequestData());
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is RequestData)
      yield _requestHomeData();
  }

   _requestHomeData() async{
     LoadingDialog.show();

   }
}
