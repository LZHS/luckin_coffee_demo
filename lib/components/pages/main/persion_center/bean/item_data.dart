class ItemData {
  String icon;
  String title;
  String subTitle;
  bool isShowDivi;

  ///```
  /// 个人中心 Item 数据
  /// String icon; 主标题旁边的图片
  /// String title; 主标题
  /// String subTitle; 副标题
  /// bool isShowDivi; 是否显示 下面的横线
  ///```
  ItemData({this.icon, this.title, this.subTitle, this.isShowDivi});

  ItemData.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    subTitle = json['subTitle'];
    isShowDivi = json['isShowDivi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['isShowDivi'] = this.isShowDivi;
    return data;
  }
}
