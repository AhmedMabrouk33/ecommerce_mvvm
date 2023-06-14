class CategoryModel {
  final String id;
  final String title;
  final String image;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '-1',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
