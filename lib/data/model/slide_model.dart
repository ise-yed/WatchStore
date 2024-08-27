class SlideModel {
  int id;
  String title;
  String image;

  SlideModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String);
  }
}
