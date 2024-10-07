

class SlidarModel {
  int? id;
  String? image;
  String? title;

  SlidarModel({this.id, this.title, this.image});

  factory SlidarModel.fromJson(Map<String, dynamic> json) => SlidarModel(
        id: json['id'] as int?,
        image: json['image'] as String?,
        title: json['title'] as String?,
      );

  
}
