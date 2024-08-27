class OrderModel {
  int? id;
  String? code;
  String? status;
  List<OrderDetails>? orderDetails;

  OrderModel({this.id, this.code, this.status, this.orderDetails});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['status'] = status;
    if (orderDetails != null) {
      data['order_details'] =
          orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  int? id;
  String? product;
  String? count;
  String? price;
  String? discountPrice;
  String? status;

  OrderDetails(
      {this.id,
        this.product,
        this.count,
        this.price,
        this.discountPrice,
        this.status});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    count = json['count'];
    price = json['price'];
    discountPrice = json['discount_price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = product;
    data['count'] = count;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['status'] = status;
    return data;
  }
}
