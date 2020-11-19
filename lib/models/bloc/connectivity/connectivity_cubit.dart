import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class ConnectivityCubit extends Cubit<int> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityCubit() : super(0) {
    try {
      _connectivity.checkConnectivity().then((value) {
        log.d("当前网络状态 : ${value.toString()}");
        Global.connectivityResult = value;
      });
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((event) {
        log.d("当前网络状态发生改变 : ${event.toString()}");
        Global.connectivityResult = event;
      });
    } on PlatformException catch (e) {
      log.e(e.message);
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
