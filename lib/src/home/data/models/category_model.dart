
class CategoryModel {
  final String name;
  final String photo;
  final int id;

  CategoryModel({required this.name, required this.photo, required this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  
}
