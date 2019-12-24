import 'package:flutter/material.dart';
///`
/// 横线 分割线 控件
///`
class DividerWidget extends StatelessWidget {
  final double height, left, right;
  final int color;
  DividerWidget({
    this.height = 1.0,
    this.left = 0.0,
    this.right = 0.0,
    this.color = 0xfff2f2f2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.height,
      margin: EdgeInsets.only(
        left: this.left,
        right: this.right,
      ),
      decoration: BoxDecoration(
        color: Color(this.color),
      ),
      alignment: Alignment.center,
    );
  }
}
