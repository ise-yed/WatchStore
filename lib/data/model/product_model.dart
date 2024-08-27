class ProductModel {
  int id;
  String title;
  int price;
  int discount;
  String specialExpiration;
  int discountPrice;
  int productCount;
  String category;
  String brand;
  String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.specialExpiration,
    required this.discountPrice,
    required this.productCount,
    required this.category,
    required this.brand,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        discount: json['discount'],
        specialExpiration: json['special_expiration'],
        discountPrice: json['discount_price'],
        productCount: json['product_count'],
        category: json['category'],
        brand: json['brand'],
        image: json['image']);
  }
}
