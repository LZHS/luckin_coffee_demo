
class BannerItem {
  String id;
  String imgPath;
  int action;
  int bannerId;
  int updateTime;

  BannerItem(
      {this.id, this.imgPath, this.action, this.bannerId, this.updateTime});

  BannerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgPath =  json['imgPath'];
    action = json['action'];
    bannerId = json['bannerId'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgPath'] = this.imgPath;
    data['action'] = this.action;
    data['bannerId'] = this.bannerId;
    data['updateTime'] = this.updateTime;
    return data;
  }
}