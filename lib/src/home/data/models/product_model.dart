
import 'category_model.dart';

class ProductModel {
  int? id;
  String? name;
  int? price;
  String? mainPhoto;
  CategoryModel? category;
  int? baseProductId;
  bool? favorite;
  String? description;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.mainPhoto,
    this.category,
    this.baseProductId,
    this.favorite,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        mainPhoto: json['main_photo'] as String?,
        category: json['category'] == null
            ? null
            : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        baseProductId: json['base_product_id'] as int?,
        favorite: json['favorite'] as bool?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'main_photo': mainPhoto,
        'category': category,
        'base_product_id': baseProductId,
        'favorite': favorite,
        'description': description,
      };
 
  
}
