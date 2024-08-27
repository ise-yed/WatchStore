class ProductDetailsModel {
  int? id;
  String? title;
  String? titleEn;
  int? price;
  int? discount;
  int? discountPrice;
  String? guaranty;
  int? productCount;
  String? category;
  String? categoryId;
  List<ColorModel>? colors;
  String? brand;
  String? brandId;
  int? review;
  String? image;
  List<Properties>? properties;
  String? description;
  String? discussion;
  List<Comment>? comments;

  ProductDetailsModel(
      {this.id,
      this.title,
      this.titleEn,
      this.price,
      this.discount,
      this.discountPrice,
      this.guaranty,
      this.productCount,
      this.category,
      this.categoryId,
      this.colors,
      this.brand,
      this.brandId,
      this.review,
      this.image,
      this.properties,
      this.description,
      this.discussion,
      this.comments});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    guaranty = json['guaranty'];
    productCount = json['product_count'];
    category = json['category'];
    categoryId = json['category_id'];
    if (json['colors'] != null) {
      colors = <ColorModel>[];
      json['colors'].forEach((v) {
        colors!.add(ColorModel.fromJson(v));
      });
    }
    brand = json['brand'];
    brandId = json['brand_id'];
    review = json['review'];
    image = json['image'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    description = json['description'];
    discussion = json['discussion'];
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_en'] = titleEn;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['guaranty'] = guaranty;
    data['product_count'] = productCount;
    data['category'] = category;
    data['category_id'] = categoryId;
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    data['brand'] = brand;
    data['brand_id'] = brandId;
    data['review'] = review;
    data['image'] = image;
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['discussion'] = discussion;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorModel {
  String? title;
  String? code;

  ColorModel({this.title, this.code});

  ColorModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['code'] = code;
    return data;
  }
}

class Properties {
  String? property;
  String? value;

  Properties({this.property, this.value});

  Properties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property'] = property;
    data['value'] = value;
    return data;
  }
}

class Comment {
  String? user;
  String? body;

  Comment({this.user, this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['body'] = body;
    return data;
  }
}
