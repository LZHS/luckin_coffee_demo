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
//    state.type = TransitionsType.SHOW_NOTICE;
//    state.noticeInfo=AppNoticeInfo();
//    emit(state);
    requestAppInfo();
  }

  requestAppInfo() async {
    _service.getAppVersion(Global.APP_ID).then(
      (entity) {
        AppNoticeInfo noticeInfo = entity.result.appNoticeInfo;
        if (noticeInfo != null) {
          state.noticeInfo = noticeInfo;
          if (noticeInfo.everValid) {
            state.type = TransitionsType.SHOW_NOTICE;
            emit(state);
            return;
          }
        } else {
          AppInfo info = entity.result.appInfo;
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

  void closeNoticeDialog() {
    /// 关闭了 公告对话框 将检查 应用是否需要更新
    log.d("关闭了 公告对话框 将检查 应用是否需要更新");
  }
}
