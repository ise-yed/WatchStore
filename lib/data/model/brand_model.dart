class BrandModel {
  int id;
  String title;
  String image;

  BrandModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String);
  }
}
