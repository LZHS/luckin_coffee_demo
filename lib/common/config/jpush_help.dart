import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class JPushHelp {
  factory JPushHelp() => _getInstance();
  static JPushHelp _instance;

  static JPushHelp _getInstance() {
    if (_instance == null) {
      _instance = JPushHelp._internal();
    }
    return _instance;
  }

  // JPush jPush;
  // String registrationID = "";
  //
  // ///接收通知回调方法
  // EventHandler _onReceiveNotification;
  //
  // ///点击通知回调方法
  // EventHandler _onOpenNotification;
  //
  // ///接收自定义消息回调方法
  // EventHandler _onReceiveMessage;
  // EventHandler _onReceiveNotificationAuthorization;
  //
  // set onReceiveNotification(EventHandler onReceiveNotification) {
  //   _onReceiveNotification = onReceiveNotification;
  // }
  //
  // set onOpenNotification(EventHandler onOpenNotification) {
  //   _onOpenNotification = onOpenNotification;
  // }
  //
  // set onReceiveMessage(EventHandler onReceiveMessage) {
  //   _onReceiveMessage = onReceiveMessage;
  // }
  //
  // set onReceiveNotificationAuthorization(
  //     EventHandler onReceiveNotificationAuthorization) {
  //   _onReceiveNotificationAuthorization = onReceiveNotificationAuthorization;
  // }

  JPushHelp._internal() {
    // jPush = JPush();
    // try {
    //   jPush.addEventHandler(
    //       onReceiveNotification:
    //           _onReceiveNotification ?? (Map<String, dynamic> message) async {},
    //       onOpenNotification:
    //           _onOpenNotification ?? (Map<String, dynamic> message) async {},
    //       onReceiveMessage:
    //           _onReceiveMessage ?? (Map<String, dynamic> message) async {},
    //       onReceiveNotificationAuthorization:
    //           _onReceiveNotificationAuthorization ??
    //               (Map<String, dynamic> message) async {});
    // } on PlatformException {}
    // jPush.setup(
    //   appKey: Global.JPUSH_APPKEY,
    //   channel: "theChannel",
    //   production: false,
    //   debug: kDebugMode,
    // );
    // jPush.applyPushAuthority(
    //     new NotificationSettingsIOS(sound: true, alert: true, badge: true));
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // jPush.getRegistrationID().then((rid) {
    //   log.d("RegistrationID : $rid");
    //   registrationID = rid;
    // });
  }

  /// 设置 别名
  // Future<Map<dynamic, dynamic>> setAlias(alias) => jPush.setAlias(alias);
}
