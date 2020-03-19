import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/animates/slide_transition_x.dart';

class AddAnimateWidget extends StatefulWidget {
  final int count;
  final bool isAdd;
  final OnClickCallBack onClickCallBack;

  AddAnimateWidget(
    this.count,
    this.isAdd,
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
      onTap: () => onClick(text),
      child: Container(
        width: 22.0,
        height: 22.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
            border: Border.all(
                color: text == "-" && this.widget.count <= 0
                    ? textColor2
                    : textColor1)),
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: 16.0,
            color:
                text == "-" && this.widget.count <= 0 ? textColor2 : textColor1,
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
        "${this.widget.count}",
        key: ValueKey<int>(this.widget.count),
        style: TextStyle(
          fontSize: 16.0,
          color: Color(0xff88afd5),
        ),
      ),
    );
  }

  onClick(String tagText) {
    if (tagText == "-") {
      this.widget.onClickCallBack(ActionEnum.subtraction);
    } else if (tagText == "+") {
      this.widget.onClickCallBack(ActionEnum.add);
    }
  }
}

typedef OnClickCallBack(ActionEnum action);

enum ActionEnum {
  add,
  subtraction,
}
