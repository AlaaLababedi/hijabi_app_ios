import 'package:dio/dio.dart';

import '../../../../core/constants/app_url.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/slidar_model.dart';


class HomeRepository {
  final Dio _dio = Dio();
  final String token = '192|0TEUAGI1nXeEZeGGmwEJNRtito91pAuVjVciJXxp25bd727d';
 
  Future<List<SlidarModel>> getSlidars() async {
    final response = await _dio.get(
      AppUrl.slider,
      options: Options(headers: _getHeaders(token)),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((json) => SlidarModel.fromJson(json))
            .toList();
      }
      throw Exception('Invalid data format');
    }
    throw Exception('Failed to load sliders');
  }

  Map<String, String> _getHeaders(token) {
    return {'Authorization': 'Bearer $token'};
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get(
      AppUrl.categories,
      options: Options(headers: _getHeaders(token)),
    );
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic> && data['categories'] is List) {
        return (data['categories'] as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
      }
      throw Exception('Invalid categories format');
    }
    throw Exception('Failed to load categories');
  }

  Future<List<ProductModel>> getMainProducts() async {
    final response = await _dio.get(
      AppUrl.mainProducts,
      options: Options(headers: _getHeaders(token)),
    );

    return _handleProductResponse(response);
  }

  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    final response = await _dio.get(
      '${AppUrl.mainProductsByCategory}$categoryId',
      options: Options(headers: _getHeaders(token)),
    );

    return _handleProductResponse(response);
  }

  Future<List<ProductModel>> _handleProductResponse(Response response) async {
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic> && data['products'] is List) {
        return (data['products'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      }
      throw Exception('Invalid data format');
    }
    throw Exception('Failed to load products');
  }
}
