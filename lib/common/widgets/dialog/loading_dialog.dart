import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  static bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    var _dialogWidth = MediaQuery.of(context).size.width * 0.26;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: _dialogWidth,
            height: _dialogWidth,
            child:
                _buildContentView(_dialogWidth /  2, _dialogWidth /  2),
          ),
        ),
      ),
    );
  }

  _buildContentView(width, height) => Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.appBackColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: LoadingAnimationWidget(width, height));

  /// 显示 跟新 对话框
  static void show(context) {
    Future.delayed(
      Duration.zero,
      () => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(),
      ),
    );
    isDisable = true;
  }

  static void cancel(context) {
    Future.delayed(
      Duration.zero,
          () => Navigator.of(context).pop(),
    );
    isDisable = false;
  }
}

/// 现在加载中动画的组件
class LoadingAnimationWidget extends StatefulWidget {
  final double width, height;

  LoadingAnimationWidget(this.width, this.height, {Key key})
      : super(key: key);

  @override
  _LoadingAnimationWidgetState createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  String textCon = "加载中...";
  Timer _timer;
final   Duration duration=Duration(milliseconds: 900);

  @override
  void initState() {
    _controller = new AnimationController(
        duration: duration, vsync: this);
    CurvedAnimation curved = CurvedAnimation(
        parent: _controller, curve: Curves.linear);
    _animation = new Tween(begin: 0.0, end: 1.0).animate(curved);
    //启动动画
    _controller.repeat();
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (timer.tick % 3 == 0)
          textCon = "加载中.";
        else if (timer.tick % 3 == 1)
          textCon = "加载中..";
        else if (timer.tick % 3 == 2) textCon = "加载中...";
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset(
            "lib/assets/images/icon_loading.png",
            width: this.widget.width,
            height: this.widget.height,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 12.0), child: Text(textCon))
      ],
    )
    ;
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}



