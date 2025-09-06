import 'package:get/get.dart';


class OrderController extends GetxController {
  Future<Map<String, dynamic>> createOrder({
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required String paymentMethod,
    String? notes,
  }) async {
    try {
      // Fake delay jese API call hoti hai
      await Future.delayed(Duration(seconds: 1));

      // Dummy order data
      final dummyOrder = {
        "orderId": DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
        "customerName": customerName,
        "customerPhone": customerPhone,
        "deliveryAddress": deliveryAddress,
        "paymentMethod": paymentMethod,
        "notes": notes ?? "No notes",
        "status": "Pending",
        "createdAt": DateTime.now().toString(),
      };

      print("📦 DEBUG: Dummy order created: $dummyOrder");

      return dummyOrder; // abhi sirf dummy return kar raha hoon
    } catch (e) {
      print("📦 DEBUG: Exception creating order: $e");
      return {
        "error": "Failed to create order: $e",
      };
    }
  }

// final OrderRepository _repository = Get.find<OrderRepository>();
  //
  // // Observable variables
  // final RxList<CartItem> _cartItems = <CartItem>[].obs;
  // final RxList<Order> _allOrders = <Order>[].obs;
  // final RxBool _isLoading = false.obs;
  // final RxBool _isProcessingOrder = false.obs;
  // final RxString _errorMessage = ''.obs;
  // final Rx<Order?> _currentOrder = Rx<Order?>(null);
  // final Rx<Map<String, double>> _cartTotals = Rx<Map<String, double>>({
  //   'subtotal': 0.0,
  //   'deliveryFee': 2.99,
  //   'totalAmount': 2.99,
  // });

  // Getters
  // List<CartItem> get cartItems => _cartItems;
  // List<Order> get allOrders => _allOrders;
  // bool get isLoading => _isLoading.value;
  // bool get isProcessingOrder => _isProcessingOrder.value;
  // String get errorMessage => _errorMessage.value;
  // Order? get currentOrder => _currentOrder.value;
  // Map<String, double> get cartTotals => _cartTotals.value;
  // int get cartItemCount =>
  //     _cartItems.fold(0, (sum, item) => sum + item.quantity);
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   loadCartItems();
  // }
  //
  // // Load cart items from Firestore
  // Future<void> loadCartItems() async {
  //   try {
  //     _isLoading.value = true;
  //     _errorMessage.value = '';
  //
  //     print('🛒 DEBUG: Loading cart items...');
  //
  //     final result = await _repository.getCartItems();
  //     if (result.isSuccess) {
  //       _cartItems.value = result.data!;
  //       await _calculateTotals();
  //       print('🛒 DEBUG: Cart items loaded: ${_cartItems.length} items');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('🛒 DEBUG: Failed to load cart items: ${result.error}');
  //     }
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to load cart items: $e';
  //     print('🛒 DEBUG: Exception loading cart items: $e');
  //   } finally {
  //     _isLoading.value = false;
  //   }
  // }
  //
  // // Add product to cart with selected options
  // Future<void> addToCart(
  //     Product product,
  //     int quantity,
  //     List<SelectedOption> selectedOptions,
  //     ) async {
  //   try {
  //     _errorMessage.value = '';
  //
  //     print('🛒 DEBUG: Adding product to cart: ${product.name}');
  //     print('🛒 DEBUG: Quantity: $quantity');
  //     print('🛒 DEBUG: Selected options: ${selectedOptions.length}');
  //
  //     // Calculate total price including options
  //     double optionsPrice = selectedOptions.fold(
  //         0.0, (sum, option) => sum + option.selectedItemPrice);
  //     double totalPrice = (product.basePrice + optionsPrice) * quantity;
  //
  //     final cartItem = CartItem(
  //       id: DateTime.now().millisecondsSinceEpoch.toString(),
  //       productId: product.id,
  //       productName: product.name,
  //       productDescription: product.description,
  //       productImageUrl: product.imageUrl,
  //       basePrice: product.basePrice,
  //       quantity: quantity,
  //       selectedOptions: selectedOptions,
  //       totalPrice: totalPrice,
  //     );
  //
  //     final result = await _repository.addToCart(cartItem);
  //     if (result.isSuccess) {
  //       await loadCartItems(); // Reload cart items
  //       print('🛒 DEBUG: Product added to cart successfully');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('🛒 DEBUG: Failed to add product to cart: ${result.error}');
  //     }
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to add product to cart: $e';
  //     print('🛒 DEBUG: Exception adding product to cart: $e');
  //   }
  // }
  //
  // // Update cart item quantity
  // Future<void> updateCartItemQuantity(String itemId, int quantity) async {
  //   try {
  //     _errorMessage.value = '';
  //
  //     print('🛒 DEBUG: Updating cart item quantity: $itemId -> $quantity');
  //
  //     final result = await _repository.updateCartItemQuantity(itemId, quantity);
  //     if (result.isSuccess) {
  //       await loadCartItems(); // Reload cart items
  //       print('🛒 DEBUG: Cart item quantity updated successfully');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('🛒 DEBUG: Failed to update cart item quantity: ${result.error}');
  //     }
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to update cart item quantity: $e';
  //     print('🛒 DEBUG: Exception updating cart item quantity: $e');
  //   }
  // }
  //
  // // Remove item from cart
  // Future<void> removeFromCart(String itemId) async {
  //   try {
  //     _errorMessage.value = '';
  //
  //     print('🛒 DEBUG: Removing item from cart: $itemId');
  //
  //     final result = await _repository.removeFromCart(itemId);
  //     if (result.isSuccess) {
  //       await loadCartItems(); // Reload cart items
  //       print('🛒 DEBUG: Item removed from cart successfully');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('🛒 DEBUG: Failed to remove item from cart: ${result.error}');
  //     }
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to remove item from cart: $e';
  //     print('🛒 DEBUG: Exception removing item from cart: $e');
  //   }
  // }
  //
  // // Clear entire cart
  // Future<void> clearCart() async {
  //   try {
  //     Get.snackbar("tracking", "order");
  //     String a = '';
  //
  //     print('🛒 DEBUG: Clearing entire cart...');
  //
  //     // final result = await _repository.clearCart();
  //     // if (result.isSuccess) {
  //     //   _cartItems.clear();
  //     //   await _calculateTotals();
  //       print('🛒 DEBUG: Cart cleared successfully');
  //
  //     // } else {
  //     //
  //     //   // _errorMessage.value = result.error!;
  //     //   // print('🛒 DEBUG: Failed to clear cart: ${result.error}');
  //     // }
  //   } catch (e) {
  //     Get.snackbar("not tracking", "order");
  //     // _errorMessage.value = 'Failed to clear cart: $e';
  //     // print('🛒 DEBUG: Exception clearing cart: $e');
  //   }
  // }
  // //
  // // Calculate cart totals
  // Future<void> _calculateTotals() async {
  //   try {
  //     final result = await _repository.calculateCartTotals();
  //     if (result.isSuccess) {
  //       _cartTotals.value = result.data!;
  //       print('🛒 DEBUG: Cart totals calculated: ${_cartTotals.value}');
  //     } else {
  //       print('🛒 DEBUG: Failed to calculate cart totals: ${result.error}');
  //     }
  //   } catch (e) {
  //     print('🛒 DEBUG: Exception calculating cart totals: $e');
  //   }
  // }
  //
  // // Create order
  // Future<void> createOrder({
  //   required String customerName,
  //   required String customerPhone,
  //   required String deliveryAddress,
  //   required String paymentMethod,
  //   String? notes,
  // }) async {
  //   try {
  //     // _isProcessingOrder.value = true;
  //     // _errorMessage.value = '';
  //     //
  //     // print('📦 DEBUG: Creating order...');
  //     // print('📦 DEBUG: Customer: $customerName');
  //     // print('📦 DEBUG: Phone: $customerPhone');
  //     // print('📦 DEBUG: Address: $deliveryAddress');
  //     // print('📦 DEBUG: Payment: $paymentMethod');
  //     //
  //     // final result = await _repository.createOrder(
  //     //   customerName: customerName,
  //     //   customerPhone: customerPhone,
  //     //   deliveryAddress: deliveryAddress,
  //     //   paymentMethod: paymentMethod,
  //     //   notes: notes,
  //     // );
  //     //
  //     // if (result.isSuccess) {
  //     //   _currentOrder.value = result.data;
  //     //   print('📦 DEBUG: Order created successfully: ${result.data!.orderId}');
  //     // } else {
  //     //   _errorMessage.value = result.error!;
  //     //   print('📦 DEBUG: Failed to create order: ${result.error}');
  //     // }
  //     //
  //     // return result;
  //   } catch (e) {
  //     // _errorMessage.value = 'Failed to create order: $e';
  //     // print('📦 DEBUG: Exception creating order: $e');
  //     // return RepositoryResult.error('Failed to create order: $e');
  //   } finally {
  //     // _isProcessingOrder.value = false;
  //   }
  // }


  // // Get order by ID
  // Future<RepositoryResult<Order>> getOrderById(String orderId) async {
  //   try {
  //     _isLoading.value = true;
  //     _errorMessage.value = '';
  //
  //     print('📦 DEBUG: Fetching order: $orderId');
  //
  //     final result = await _repository.getOrderById(orderId);
  //     if (result.isSuccess) {
  //       _currentOrder.value = result.data;
  //       print('📦 DEBUG: Order fetched successfully');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('📦 DEBUG: Failed to fetch order: ${result.error}');
  //     }
  //
  //     return result;
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to fetch order: $e';
  //     print('📦 DEBUG: Exception fetching order: $e');
  //     return RepositoryResult.error('Failed to fetch order: $e');
  //   } finally {
  //     _isLoading.value = false;
  //   }
  // }
  //
  // // Get all orders
  // Future<RepositoryResult<List<Order>>> getAllOrders() async {
  //   try {
  //     _isLoading.value = true;
  //     _errorMessage.value = '';
  //
  //     print('📦 DEBUG: Fetching all orders...');
  //
  //     final result = await _repository.getAllOrders();
  //     if (result.isSuccess) {
  //       _allOrders.value = result.data!;
  //       print('📦 DEBUG: Orders fetched: ${result.data!.length} orders');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('📦 DEBUG: Failed to fetch orders: ${result.error}');
  //     }
  //
  //     return result;
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to fetch orders: $e';
  //     print('📦 DEBUG: Exception fetching orders: $e');
  //     return RepositoryResult.error('Failed to fetch orders: $e');
  //   } finally {
  //     _isLoading.value = false;
  //   }
  // }
  //
  // // Get all orders synchronously (from cached data)
  // List<Order> getAllOrdersSync() {
  //   return _allOrders;
  // }
  //
  // // Update order status
  // Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
  //   try {
  //     _errorMessage.value = '';
  //
  //     print('📦 DEBUG: Updating order status: $orderId -> ${status.name}');
  //
  //     final result = await _repository.updateOrderStatus(orderId, status);
  //     if (result.isSuccess) {
  //       // Update current order if it's the same order
  //       if (_currentOrder.value?.orderId == orderId) {
  //         _currentOrder.value = _currentOrder.value!.copyWith(status: status);
  //       }
  //       print('📦 DEBUG: Order status updated successfully');
  //     } else {
  //       _errorMessage.value = result.error!;
  //       print('📦 DEBUG: Failed to update order status: ${result.error}');
  //     }
  //   } catch (e) {
  //     _errorMessage.value = 'Failed to update order status: $e';
  //     print('📦 DEBUG: Exception updating order status: $e');
  //   }
  // }
  //
  // // Clear current order
  // void clearCurrentOrder() {
  //   _currentOrder.value = null;
  //   print('📦 DEBUG: Current order cleared');
  // }
  //
  // // Clear error message
  // void clearError() {
  //   _errorMessage.value = '';
  // }
  //
  // // Get pending orders count
  // int getPendingOrdersCount() {
  //   return _allOrders
  //       .where((order) => order.status == OrderStatus.pending)
  //       .length;
  // }
  //
  // // Get pending orders
  // List<Order> getPendingOrders() {
  //   return _allOrders
  //       .where((order) => order.status == OrderStatus.pending)
  //       .toList();
  // }
  //
  // // Logout - clear all data
  // void logout() {
  //   _cartItems.clear();
  //   _allOrders.clear();
  //   _currentOrder.value = null;
  //   _cartTotals.value = {
  //     'subtotal': 0.0,
  //     'deliveryFee': 2.99,
  //     'totalAmount': 2.99,
  //   };
  //   _errorMessage.value = '';
  //   print('🚪 DEBUG: User logged out - all data cleared');
  // }
}
