import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

///`
/// 横线 分割线 控件
///`
class DividerWidget extends StatelessWidget {
  final double height, left, right;
  final Color color;

  DividerWidget({
    this.height = 1.0,
    this.left = 0.0,
    this.right = 0.0,
    this.color = AppColors.appDividerColor,
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
        color: color,
      ),
      alignment: Alignment.center,
    );
  }
}
