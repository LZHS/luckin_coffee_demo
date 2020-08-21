import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/components/components.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TransitionsPage();
});
