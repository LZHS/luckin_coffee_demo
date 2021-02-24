import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final BuildContext context;

  MenuBloc(this.context) : super(InitialMenuState());

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is InitialMenuState) yield* _initPageData();
  }

  _initPageData() async* {
    showDialog(context: context);

    Stream.fromFutures([
      Future.delayed(Duration(seconds: Random().nextInt(9))).then((_)=>Random().nextInt(9)),
      Future.delayed(Duration(seconds: Random().nextInt(5))).then((_)=>"Random().nextInt(9)")
    ]);


  }
}
