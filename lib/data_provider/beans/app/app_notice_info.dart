class AppNoticeInfo {
  ///公告生效时间
  String forceTime;
  ///公告有效时长（单位小时）
  int validDuration;
  ///公告信息 信息 描述
  String noticeInfo;
  /// APP状态,0可用1不可用
  bool enabledStatus;
  ///公告是否永久有效 0有效1短时间有效
  bool everValid;

  AppNoticeInfo(
      {this.forceTime,
        this.validDuration,
        this.noticeInfo,
        this.enabledStatus,
        this.everValid});

  AppNoticeInfo.fromJson(Map<String, dynamic> json) {
    forceTime = json['forceTime'];
    validDuration = json['validDuration']; 
    noticeInfo = json['noticeInfo'];
    enabledStatus = json['enabledStatus'];
    everValid = json['everValid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forceTime'] = this.forceTime;
    data['validDuration'] = this.validDuration;
    data['noticeInfo'] = this.noticeInfo;
    data['enabledStatus'] = this.enabledStatus;
    data['everValid'] = this.everValid;
    return data;
  }
}
