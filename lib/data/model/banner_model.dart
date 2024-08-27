class BannerModel{
  int id;
  String title;
  String image;
  String createdAt;
  String updatedAt;

  BannerModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
});

  factory BannerModel.fromJson(Map<String,dynamic> json){
    return BannerModel(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String);
  }

}