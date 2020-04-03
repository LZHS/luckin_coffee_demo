import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/animates/slide_transition_x.dart';

class AddAnimateWidget extends StatefulWidget {
  int initVal=0;
  bool isAdd =true;
  final OnClickCallBack onClickCallBack;

  AddAnimateWidget(
    this.initVal,
    this.onClickCallBack, {
    Key key,
  }) : super(key: key);

  @override
  _AddAnimateWidgetState createState() => _AddAnimateWidgetState();
}

class _AddAnimateWidgetState extends State<AddAnimateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 22.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildControlWidget("-"),
          Expanded(
            flex: 1,
            child: buildAnimateText(),
          ),
          buildControlWidget("+"),
        ],
      ),
    );
  }

  buildControlWidget(String text) {
    Color textColor1 = Color(0xff88afd5);
    Color textColor2 = Color(0x9988afd5);

    return GestureDetector(
      onTap: () =>
          onClick(text == "+" ? ActionEnum.add : ActionEnum.subtraction),
      child: Container(
        width: 22.0,
        height: 22.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
            border: Border.all(
                color: text == "-" && this.widget.initVal <= 0
                    ? textColor2
                    : textColor1)),
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: 16.0,
            color: text == "-" && this.widget.initVal <= 0
                ? textColor2
                : textColor1,
          ),
        ),
      ),
    );
  }

  /// 创建 中间 文字 具有动画效果控件
  buildAnimateText() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransitionX(
            child: child,
            transformHitTests: false,
            direction:
                this.widget.isAdd ? AxisDirection.up : AxisDirection.down,
            position: animation,
          ),
        );
      },
      child: Text(
        "${this.widget.initVal}",
        key: ValueKey<int>(this.widget.initVal),
        style: TextStyle(
          fontSize: 16.0,
          color: Color(0xff88afd5),
        ),
      ),
    );
  }

  onClick(ActionEnum action) {
    switch (action) {
      case ActionEnum.add:
        setState(() {
          this.widget.initVal++;
          this.widget.isAdd = true;
        });
        this.widget.onClickCallBack(this.widget.initVal);
        break;
      case ActionEnum.subtraction:
        if (this.widget.initVal == 0) break;
        setState(() {
          this.widget.initVal--;
          this.widget.isAdd = false;
        });
        this.widget.onClickCallBack(this.widget.initVal);
        break;
    }
  }
}

typedef OnClickCallBack(int result);

enum ActionEnum {
  add,
  subtraction,
}
