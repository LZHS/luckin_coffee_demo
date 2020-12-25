import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/config/res/colors.dart';

/// 通用 按钮 封装
class AppButton extends StatelessWidget {
  final String text;

  /// 按钮 宽、高 ,宽默认充满父控件
  final double width, height;
  final VoidCallback onTap;

  /// 按钮文字样式
  final TextStyle style;

  /// 按钮 边框颜色
  final Color borderColor;

  /// 按钮背景颜色
  final Color backColor;

  /// 点击 水波纹颜色
  final Color highlightColor;

  /// 按钮左侧图片
  final String leftImgPath;

  const AppButton({
    Key key,
    @required this.text,
    this.width = double.infinity,
    this.height = 40.0,
    this.onTap,
    this.style = const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
    this.borderColor = AppColors.appTheme88afd5,
    this.backColor = AppColors.appTheme88afd5,
    this.highlightColor = AppColors.appTheme4280BD,
    this.leftImgPath = "",
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
          decoration: BoxDecoration(
            color: backColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            highlightColor: highlightColor,
            radius: 0.0,
            onTap: () => onTap?.call(),
            child: Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: leftImgPath.isNotEmpty,
                    child: Image.asset(leftImgPath,
                        width: 16.0, height: 16.0, fit: BoxFit.cover),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        text,
                        style: style,
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
