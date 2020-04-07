import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatefulWidget {
  StaggerAnimation({Key key}) : super(key: key);

  @override
  _StaggerAnimationState createState() => _StaggerAnimationState();
}

class _StaggerAnimationState extends State<StaggerAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
  }

  Future _playAnimation() async {
    try {
      // 先正向执行动画
      await _controller.forward().orCancel;
      //在反向 执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交织动画"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _playAnimation,
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: StaggerChildAnimation(controller: _controller),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StaggerChildAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerChildAnimation({Key key, this.controller}) : super(key: key) {
    // 高度动画
    height = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));

    color = ColorTween(
      begin: Color(0xff000000),
      end: Color(0xffffffff),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));

    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: 150.0))
        .animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.3, 1.0, curve: Curves.ease),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Padding _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: padding.value,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 50.0,
          height: height.value,
          color: color.value,
        ),
      ),
    );
  }
}
