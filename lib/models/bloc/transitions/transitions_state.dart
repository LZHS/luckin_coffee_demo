part of 'transitions_cubit.dart';

class TransitionsState {
  TransitionsType type = TransitionsType.INIT_STATE;


  TransitionsState();

}

enum TransitionsType {
  /// 初始 状态不做任何操作
  INIT_STATE,
  /// 开始倒计时
  START_TIMER,
  /// 显示 更新对话框
  SHOW_UPDATE,
  ///
  SHOW_NOTICE,
}
