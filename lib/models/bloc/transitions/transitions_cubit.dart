import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/common/widgets/dialog/update_dialog.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';

part 'transitions_state.dart';

class TransitionsCubit extends Cubit<TransitionsState> {
  final BuildContext context;
  final AppService _service = AppServiceImp();
  AppVersion _appVersion;
  TransitionsCubit transitionsCubit;

  TransitionsCubit(this.context) : super(TransitionsState()) {
    this.transitionsCubit = this;
    requestAppInfo();
  }

  requestAppInfo() async {
    _service.getAppVersion(Global.APP_ID).then(
      (entity) {
        this._appVersion = entity.result;
        if (this._appVersion.appNoticeInfo != null) {
          if (this._appVersion.appNoticeInfo.everValid) {
            _showNoticeDialog();
            return;
          }
        } else if (this._appVersion.appInfo != null) {
          checkUpdate();
        } else {
          // 没有公告，没有更新信息直接跳转
          state.type = TransitionsType.START_TIMER;
          emit(state);
        }
      },
      onError: (err) {
        if (err is BaseEntity) {
          state.type = TransitionsType.START_TIMER;
          emit(state);
          showToast(err.message);
        }
      },
    ).whenComplete(() {});
  }

  downApkProgress() {}

  /// 检查版本是否更新
  checkUpdate() {
    log.d("检查版本跟新");
    AppInfo appInfo = this._appVersion.appInfo;
    if (appInfo != null) {
      PackageInfo.fromPlatform().then((packageInfo) {
        if (appInfo.appVersionCode - int.parse(packageInfo.buildNumber) > 0) {
          /// 说明服务器有新版本
          /// 在android 只能强制更新apk或者跳转到谷歌stop去下载。
          /// 在ios，只能提醒去 App Store 官网下载。
          // if(Platform.isIOS){
          //   //ios相关代码
          // }else
          if (Platform.isAndroid) {
            //android相关代码
            _showUpdateDialog();
          }
        } else {
          goHome();
        }
      });
    } else {
      // 没有公告，没有更新信息直接跳转
      state.type = TransitionsType.START_TIMER;
      emit(state);
    }
  }

  /// 显示 公告对话框
  _showNoticeDialog() {
    Future.delayed(
      Duration.zero,
      () => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) => NoticeDialog(
          noticeInfo: this._appVersion.appNoticeInfo,
          onTap: checkUpdate,
        ),
      ),
    );
  }

  /// 显示 跟新 对话框
  _showUpdateDialog() {
    Future.delayed(
      Duration.zero,
      () => showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) => BlocProvider.value(
                value: transitionsCubit,
                child: UpdateDialog(
                    appInfo: this._appVersion.appInfo,
                    updateApp: () =>
                        _startDown(this._appVersion.appInfo.appUrl),
                    next: goHome),
              )),
    );
  }

  goHome() => Routes.goMainPage(context);

  _startDown(urlPath) async {
    await getExternalStorageDirectory().then((value) {
      log.d(" 文件存储路径： ${value.path}");
      _service.download(
        urlPath,
        value.path + "/${this._appVersion.appInfo.appVersion}.apk",
        (count, total) {
          TransitionsState _state=TransitionsState();
          _state.type = TransitionsType.DOWN_PROGRESS;
          _state.receiveProgress = ReceiveProgress(count, total);
          emit(_state);
        },
      );
    });
  }
}
