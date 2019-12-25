class OrderBean {
  String orderId;
  String orderStatus;
  String orderTime;
  bool isEvaluation;
  String totalPrice;
  String customerAddress;
  List<String> products;

  OrderBean(
      {this.orderId,
      this.orderStatus,
      this.orderTime,
      this.isEvaluation,
      this.totalPrice,
      this.customerAddress,
      this.products});

  OrderBean.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderStatus = json['orderStatus'];
    orderTime = json['orderTime'];
    isEvaluation = json['isEvaluation'];
    totalPrice = json['totalPrice'];
    customerAddress = json['customerAddress'];
    products = json['products'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderStatus'] = this.orderStatus;
    data['orderTime'] = this.orderTime;
    data['isEvaluation'] = this.isEvaluation;
    data['totalPrice'] = this.totalPrice;
    data['customerAddress'] = this.customerAddress;
    data['products'] = this.products;
    return data;
  }
}
