import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_indicator_view/loading_indicator_view.dart';
import 'package:luckin_coffee_demo/common/common.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  static bool isDisable = false;
  static StreamController<int> _streamController;
  final String progressText = "加载中...";
  static BuildContext _context;

  /// 显示 和 构建 对话框的时间
  static int _showDialogTime = 0, _buildDialogTime = 0;

  /// 显示 跟新 对话框
  static void show(context) {
    _showDialogTime = DateTime.now().millisecondsSinceEpoch;
    Future.delayed(Duration.zero, () {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          LoadingDialog._context = context;
          isDisable = true;
          _buildDialogTime = DateTime.now().millisecondsSinceEpoch;
          return LoadingDialog();
        },
      );
    });
  }

  static void cancel() {
    if (_showDialogTime != 0) {
      var duration = Duration.zero;
      if (_buildDialogTime == 0 ||
          _buildDialogTime - DateTime.now().millisecondsSinceEpoch <= 0)
        duration = Duration(milliseconds: 500);
      Future.delayed(
        duration,
        () {
          if (_streamController != null && _streamController.isClosed) {
            _streamController.close();
            _streamController = null;
          }
          if (LoadingDialog._context != null)
            Navigator.of(LoadingDialog._context).pop();
          LoadingDialog._context = null;
          _showDialogTime = 0;
          _buildDialogTime = 0;
          isDisable = false;
        },
      );
    }
  }

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
            child: _buildContentView(_dialogWidth / 2, _dialogWidth / 2),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildProgressWidget(width), _buildProgressText(height)],
        ),
      );

  _buildProgressText(width) =>
      Container(
        margin: const EdgeInsets.only(left: 22, top: 10.0),
        width: double.infinity,
        child: StreamBuilder(
          stream: _buildStream(),
          initialData: 0,
          builder: (_, snapshot) {
            int endIndex = 3 + snapshot.data % 4;
            return Text(progressText.substring(0, endIndex));
          },
        ),);

  Stream<int> _buildStream() {
    _streamController = StreamController();
    Stream<int>.periodic(Duration(seconds: 1), (data) => data)
        .takeWhile((element) {
      return (_streamController != null && !_streamController.isClosed);
    }).listen((event) =>
        _streamController.add(event));
    return _streamController.stream;
  }

  _buildProgressWidget(width) =>
      SizedBox.fromSize(
        child: BallSpinFadeLoaderIndicator(
          radius: 40,
          ballColor: AppColors.appTheme4280BD,
        ),
        size: Size(width, width),
      );


}
