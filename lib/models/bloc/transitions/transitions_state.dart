part of 'transitions_cubit.dart';

class TransitionsState {
  TransitionsType type = TransitionsType.INIT_STATE;

  TransitionsState();

  ReceiveProgress receiveProgress;
}

enum TransitionsType {
  /// 初始 状态不做任何操作
  INIT_STATE,

  /// 开始倒计时
  START_TIMER,

  /// 显示 更新对话框
  SHOW_UPDATE,

  /// 显示 公告 对话框
  SHOW_NOTICE,

  /// 开始下载 更新 APK 进度
  DOWN_PROGRESS,
}

class ReceiveProgress {
  final int count, total;

  ReceiveProgress(this.count, this.total);
}
