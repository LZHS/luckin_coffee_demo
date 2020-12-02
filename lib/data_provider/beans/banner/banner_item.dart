class BannerItem {
  String id;
  String imgPath;
  int action;

  BannerItem({this.id, this.imgPath, this.action});

  BannerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgPath = json['imgPath'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgPath'] = this.imgPath;
    data['action'] = this.action;
    return data;
  }

  @override
  String toString() {
    return 'BannerItem{id: $id, imgPath: $imgPath, action: $action}';
  }
}
