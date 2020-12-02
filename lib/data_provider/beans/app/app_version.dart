

import 'app_info.dart';
import 'app_notice_info.dart';

class AppVersion{
  AppNoticeInfo appNoticeInfo;
  AppInfo appInfo;

  AppVersion({this.appNoticeInfo, this.appInfo});

  AppVersion.fromJson(Map<String, dynamic> json) {
    appNoticeInfo = json['appNoticeInfo'] != null
        ? new AppNoticeInfo.fromJson(json['appNoticeInfo'])
        : null;
    appInfo =
    json['appInfo'] != null ? new AppInfo.fromJson(json['appInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appNoticeInfo != null) {
      data['appNoticeInfo'] = this.appNoticeInfo.toJson();
    }
    if (this.appInfo != null) {
      data['appInfo'] = this.appInfo.toJson();
    }
    return data;
  }
}