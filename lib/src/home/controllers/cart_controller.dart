import 'package:get/get.dart';

import '../../../core/asstes/app_images.dart';
import '../data/models/product_model.dart';


class CartController extends GetxController {  var count = 0.obs;

  var cartItems = <Map<String, dynamic>>[
    {
      'productName': 'Product 1',
      'imageUrl': AppImages.cat1,
      'price': 200.0,
      'quantity': 1.obs, 
    },
    {
      'productName': 'Product 2',
      'imageUrl': AppImages.cat1,
      'price': 150.0,
      'quantity': 2.obs,
    },
  ].obs;

  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }
  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      cartItems[index]['quantity'].value = newQuantity; 
    }
    update(); 
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }
 void addToCart(ProductModel product, int quantity) {
    cartItems.add({'product': product, 'quantity': quantity});
  }

  double get total {
    return cartItems.fold(0.0, (sum, item) {
      return sum + (item['price'] * item['quantity'].value); 
    });
  }
}