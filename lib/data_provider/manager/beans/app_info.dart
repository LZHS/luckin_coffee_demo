
class AppInfo {
  String appVersion;
  int appVersionCode;
  String appUrl;
  String appDescription;
  bool forceUpdate;

  AppInfo(
      {this.appVersion,
        this.appVersionCode,
        this.appUrl,
        this.appDescription,
        this.forceUpdate});

  AppInfo.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    appVersionCode = json['appVersionCode'];
    appUrl = json['appUrl'];
    appDescription = json['appDescription'];
    forceUpdate = json['forceUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appVersion'] = this.appVersion;
    data['appVersionCode'] = this.appVersionCode;
    data['appUrl'] = this.appUrl;
    data['appDescription'] = this.appDescription;
    data['forceUpdate'] = this.forceUpdate;
    return data;
  }

  @override
  String toString() {
    return 'AppInfo{appVersion: $appVersion, appVersionCode: $appVersionCode, appUrl: $appUrl, appDescription: $appDescription, forceUpdate: $forceUpdate}';
  }
}