import 'package:flutter/material.dart';

/// 上下位移 动画
class SlideAnimation extends AnimatedWidget {
  final Animation<Offset> animation;
  SlideAnimation({@required this.animation}) : super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child:   Container(
          width: double.infinity,
          height: 44.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ), 
    ); 
  }
}
