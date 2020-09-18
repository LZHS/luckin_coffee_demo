import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        type: MaterialType.transparency,
        child: _buildContentView(),
      ),
    );
  }

  _buildContentView() => Container(
        alignment: Alignment.center,
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
            color: AppColors.appBackColor,
            borderRadius: BorderRadius.circular(10.0)),
      );

  /// 显示 跟新 对话框
  static show() => Future.delayed(
        Duration.zero,
        () => showDialog<void>(
          context: Application.context,
          barrierDismissible: false,
          builder: (_) => LoadingDialog(),
        ),
      );

  static cancel() => Future.delayed(
        Duration.zero,
        () => Navigator.of(Application.context).pop(),
      );
}
