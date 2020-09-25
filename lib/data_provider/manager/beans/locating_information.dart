class LocatingInformation {
  String storeName;
  String distance;
  bool isTakeTheir;

  LocatingInformation({this.storeName, this.distance, this.isTakeTheir});

  LocatingInformation.fromJson(Map<String, dynamic> json) {
    storeName = json['storeName'];
    distance = json['distance'];
    isTakeTheir = json['isTakeTheir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeName'] = this.storeName;
    data['distance'] = this.distance;
    data['isTakeTheir'] = this.isTakeTheir;
    return data;
  }
}