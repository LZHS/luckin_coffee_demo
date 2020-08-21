part of 'transitions_cubit.dart';

class TransitionsState {
  TransitionsType type = TransitionsType.INIT;

  AppInfo info;
  AppNoticeInfo noticeInfo;

  TransitionsState();

}

enum TransitionsType {
  /// 初始化状态
  INIT,
  /// 不做任何操作
  NO_ACTION,
  /// 显示 更新对话框
  SHOW_UPDATE,
  /// 显示 公告对话框
  SHOW_NOTICE,
}
