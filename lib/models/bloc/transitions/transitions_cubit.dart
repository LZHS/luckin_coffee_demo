import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';

part 'transitions_state.dart';

class TransitionsCubit extends Cubit<TransitionsState> {
  final BuildContext context;
  final AppService _service = AppServiceImp();

  TransitionsCubit(this.context) : super(TransitionsState()){
    requestAppInfo();
  }

  requestAppInfo() async {
    await _service.getAppVersion(Global.APP_ID).then(
      (entity) {
        AppNoticeInfo noticeInfo=entity.result.appNoticeInfo ;
        if(noticeInfo!=null){
          state.noticeInfo=noticeInfo;
          if(noticeInfo.everValid){
            state.type=TransitionsType.SHOW_NOTICE;
            emit(state);
            return;
          }
        }else{
          AppInfo info=entity.result.appInfo;

        }
      },
      onError: (err) {},
    ).whenComplete(() {});
  }
}
