///```
/// 咖啡钱包，Item 数据
/// String id;
/// String category; 类别
/// String scopeOf; 使用范围
/// String price; 价格
/// String remainingNum; 使用 数量
///```
class CoffeeWalletItem {
  String id;
  String category;
  String scopeOf;
  String price;
  String remainingNum;

  CoffeeWalletItem(
      {this.id, this.category, this.scopeOf, this.price, this.remainingNum});

  CoffeeWalletItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    scopeOf = json['scopeOf'];
    price = json['price'];
    remainingNum = json['remainingNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['scopeOf'] = this.scopeOf;
    data['price'] = this.price;
    data['remainingNum'] = this.remainingNum;
    return data;
  }

  @override
  String toString() {
    return 'CoffeeWalletItem{id: $id, category: $category, scopeOf: $scopeOf, price: $price, remainingNum: $remainingNum}';
  }


}
