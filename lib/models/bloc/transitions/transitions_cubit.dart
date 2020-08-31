import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

part 'transitions_state.dart';

class TransitionsCubit extends Cubit<TransitionsState> {
  final BuildContext context;
  final AppService _service = AppServiceImp();

  TransitionsCubit(this.context) : super(TransitionsState()) {
    requestAppInfo();
  }

  requestAppInfo() async {
    _service.getAppVersion(Global.APP_ID).then(
      (entity) {
        this.state.noticeInfo = entity.result.appNoticeInfo;
        this.state.appInfo = entity.result.appInfo;
        if (this.state.noticeInfo != null) {
          if (this.state.noticeInfo.everValid) {
            state.type = TransitionsType.SHOW_NOTICE;
            emit(state);
            return;
          }
        } else if (this.state.appInfo != null) {
        } else {
          // 没有公告，没有更新信息直接跳转
          state.type = TransitionsType.NO_ACTION;
          emit(state);
        }
      },
      onError: (err) {
        if (err is BaseEntity) {
          state.type = TransitionsType.NO_ACTION;
          emit(state);
          showToast(err.message);
        }
      },
    ).whenComplete(() {});
  }
/// 关闭了 公告对话框 将检查 应用是否需要更新
  void closeNoticeDialog() {
    AppInfo appInfo = this.state.appInfo;
    if (appInfo != null) {

    } else {
      // 没有公告，没有更新信息直接跳转
      state.type = TransitionsType.NO_ACTION;
      emit(state);
    }
  }



}
