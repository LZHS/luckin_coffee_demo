import 'dart:async';

import 'package:flutter/material.dart';

/// APP 的第一个页面 ，用于展示过度页面
class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  Timer _timer;
  final int count=3;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ConstrainedBox(
        child: Image.asset(
          "lib/assets/images/icon_transition.png",
          fit: BoxFit.cover,
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }

  startTime()async{

    
  }
}
