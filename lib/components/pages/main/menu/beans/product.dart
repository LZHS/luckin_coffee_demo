class ProductList {
  String categoryName;
  String info;
  List<ProductInfo> productInfo;

  ProductList({this.categoryName, this.info, this.productInfo});

  ProductList.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    info = json['info'];
    if (json['productInfo'] != null) {
      productInfo = new List<ProductInfo>();
      json['productInfo'].forEach((v) {
        productInfo.add(new ProductInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['info'] = this.info;
    if (this.productInfo != null) {
      data['productInfo'] = this.productInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductInfo {
  String name;
  String describe;
  String specifications;
  int unitPrice;
  String discountInfo;
  String img;

  ProductInfo(
      {this.name,
      this.describe,
      this.specifications,
      this.unitPrice,
      this.discountInfo,
      this.img});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    describe = json['describe'];
    specifications = json['specifications'];
    unitPrice = json['unitPrice'];
    discountInfo = json['discountInfo'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['describe'] = this.describe;
    data['specifications'] = this.specifications;
    data['unitPrice'] = this.unitPrice;
    data['discountInfo'] = this.discountInfo;
    data['img'] = this.img;
    return data;
  }
}