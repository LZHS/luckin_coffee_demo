import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/app/app_component.dart';
void collectLog(String line){
   //收集日志
}
void reportErrorAndLog(FlutterErrorDetails details){
    //上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
   // 构建错误信息
}
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
        () => runApp(AppComponent()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );

}
 