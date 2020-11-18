import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class ConnectivityCubit extends Cubit<int> {
  ConnectivityCubit() : super(0) {
    final Connectivity _connectivity = Connectivity();
    try {
      _connectivity.checkConnectivity().then((value) {
        log.d("当前网络状态 : ${value.toString()}");
        Global.connectivityResult = value;
      });
    } on PlatformException catch (e) {
      log.e(e.message);
    }
  }
}
