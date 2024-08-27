class CategoryModel {
  int id;
  String title;
  String image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String);
  }
}
