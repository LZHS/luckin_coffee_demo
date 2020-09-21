import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class LoadingDialog extends Dialog {
  static bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    // 设置弹框的宽度为屏幕宽度的86%
    var _dialogWidth = MediaQuery.of(context).size.width * 0.35;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: _dialogWidth,
            height: _dialogWidth,
            child: _buildContentView(),
          ),
        ),
      ),
    );
  }

  _buildContentView() => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.appBackColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Text("data"),
      );

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
