import 'package:_ios/src/home/presentation/widgets/products/prodct_body.dart';
import 'package:flutter/material.dart';


import '../../data/models/product_model.dart';


class ProductView extends StatelessWidget {
  final String name;
  final String description;
  final String categoryName;
  final String imageUrl;
  final bool favorite;
  final int price;final ProductModel product;
  const ProductView(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.categoryName,
      required this.favorite,
      required this.price,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductBody(
        imageUrl: imageUrl,
        favorite: favorite,
        name: name,
        price: price,
        categoryName: categoryName,
        description: description,
        product: product,
      ),
    );
  }
}
