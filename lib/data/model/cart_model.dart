class CartModel {
  List<UserCart>? userCart;
  int? cartTotalPrice;
  int? totalWithoutDiscountPrice;

  CartModel(
      {this.userCart, this.cartTotalPrice, this.totalWithoutDiscountPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['user_cart'] != null) {
      userCart = <UserCart>[];
      json['user_cart'].forEach((v) {
        userCart!.add(UserCart.fromJson(v));
      });
    }
    cartTotalPrice = json['cart_total_price'];
    totalWithoutDiscountPrice = json['total_without_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userCart != null) {
      data['user_cart'] = userCart!.map((v) => v.toJson()).toList();
    }
    data['cart_total_price'] = cartTotalPrice;
    data['total_without_discount_price'] = totalWithoutDiscountPrice;
    return data;
  }
}

class UserCart {
  int? id;
  String? productId;
  String? product;
  String? count;
  int? price;
  int? discount;
  int? discountPrice;
  String? image;
  bool countLoading = false;
  bool deleteLoading = false;

  UserCart({
    this.id,
    this.productId,
    this.product,
    this.count,
    this.price,
    this.discount,
    this.discountPrice,
    this.image,
    this.countLoading = false,
    this.deleteLoading = false,
  });

  UserCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    product = json['product'];
    count = json['count'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product'] = product;
    data['count'] = count;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    return data;
  }
}
