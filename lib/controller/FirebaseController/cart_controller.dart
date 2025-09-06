import 'package:get/get.dart';

class CartController extends GetxController {
  /// Global cart list
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  /// Add product to cart
  void addToCart(Map<String, dynamic> product) {
    int index = cartItems.indexWhere((item) => item["productId"] == product["productId"]);
    if (index != -1) {
      cartItems[index]["quantity"]++;
      cartItems.refresh();
    } else {
      cartItems.add({
        ...product,
        "quantity": 1,
      });
      cartItems.refresh();
    }
  }

  /// Increase quantity
  void increaseQty(String productId) {
    int index = cartItems.indexWhere((item) => item["productId"] == productId);
    if (index >= 0) {
      cartItems[index]["quantity"] += 1;
      cartItems.refresh();
    }
  }

  ///  Decrease quantity
  void decreaseQty(String productId) {
    int index = cartItems.indexWhere((item) => item["productId"] == productId);
    if (index >= 0 && cartItems[index]["quantity"] > 1) {
      cartItems[index]["quantity"] -= 1;
      cartItems.refresh();
    }
  }

  /// Remove product
  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item["productId"] == productId);
    cartItems.refresh();
  }

  /// Calculate Total Price
  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) {
      double price = double.tryParse(item["productPrice"].toString()) ?? 0.0;
      int qty = item["quantity"];
      return sum + (price * qty);
    });
  }
}
