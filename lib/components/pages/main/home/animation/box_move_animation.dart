import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';

/// 位移控件
class BoxMoveAnimation extends StatefulWidget {
  @override
  _BoxMoveAnimationState createState() => _BoxMoveAnimationState();
}

class _BoxMoveAnimationState extends State<BoxMoveAnimation>
    with TickerProviderStateMixin {
  bool isSel = true;
  AnimationController controller;
  Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    animation = Tween(
      begin: Offset.zero,
      end: Offset(1.0, 0.0),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Log.d(" 点击 时 的状态 $isSel");
          if (isSel)
            controller.forward();
          else
            controller.reverse();
          isSel = !isSel;
        });
      },
      child: Container(
        width: 90.0,
        height: 36.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff88afd5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          width: 84.0,
          height: 30.0,
          child: Stack(
            children: <Widget>[
              SlideTransition(
                position: animation,
                child: Container(
                  width: 42.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Color(0xff88afd5),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "自提",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: !isSel ? Color(0xff88afd5) : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "外送",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: isSel ? Color(0xff88afd5) : Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
