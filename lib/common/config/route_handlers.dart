
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/home/home_component.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeComponent();
});
