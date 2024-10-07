import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../home/data/models/product_model.dart';
import '../../controller/search_controller.dart';

class SearchRepository {
  final Dio _dio = Dio();
  final String token = '192|0TEUAGI1nXeEZeGGmwEJNRtito91pAuVjVciJXxp25bd727d';

  Future<List<ProductModel>> searchByName() async {
    final response = await _dio.get(
      'https://back-demo.dmmobiles.com/api/product?search=${Get.find<SearchControl>().searchText.value}',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
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
