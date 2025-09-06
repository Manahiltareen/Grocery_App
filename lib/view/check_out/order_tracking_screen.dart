// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:groceryapp_with_firebase/controller/FirebaseController/productlist_Controller/orderComtroller.dart';
// import 'package:groceryapp_with_firebase/controller/utils/constants/responsive-text-size.dart';
// import 'package:groceryapp_with_firebase/view/home_view/home-screen/home_screen.dart';
//
//
// Widget customText(String text, BuildContext context,
//     {Color color = Colors.black,
//       double? fontSize,
//       FontWeight fontWeight = FontWeight.normal}) {
//   return Text(
//     text,
//     style: TextStyle(
//       fontSize: fontSize ??
//           FontSizeUtil.getFontSize(context,
//               mobile: 13, tablet: 15, desktop: 17),
//       color: color,
//       fontWeight: fontWeight,
//       letterSpacing: 0.2,
//     ),
//   );
// }
//
// class OrderTrackingScreen extends StatelessWidget {
//   const OrderTrackingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OrderController>(
//         init: OrderController(),
//         builder: (orderController) => Scaffold(
//           backgroundColor: const Color(0xFFFAFAFA),
//           appBar: AppBar(
//             title: const Text('Order Tracking'),
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.black,
//             elevation: 0,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const HomeScreen()),
//                 );
//               },
//             ),
//           ),
//           body:
//           Obx(() {
//             final order = "order";
//
//             if (order == null) {
//               return const Center(
//                 child: Text('No order found'),
//               );
//             }
//
//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Order ID Card
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Order ID',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "id",
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Status: ${"pending"}',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Estimated Delivery
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Estimated Delivery',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "2:00",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Order Details
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Order Details',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         _buildOrderInfoRow('Customer' , 'name'),
//                         _buildOrderInfoRow('Phone', '0976754343'),
//                         _buildOrderInfoRow(
//                             'Address', 'crbc'),
//                         _buildOrderInfoRow('Payment', "cod"),
//                         _buildOrderInfoRow('Total',
//                             '£${"4"}'),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Order Items
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Order Items',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         // ...order.items
//                         //     .map((item) => _buildOrderItemRow(item)),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//                 ],
//               ),
//             );
//           }),
//         ));
//   }
//
//   Widget _buildOrderInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderItemRow( item) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item.productName,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 if (item.selectedOptions.isNotEmpty)
//                   Text(
//                     'Options: ${item.selectedOptions.map((o) => o.selectedItemName).join(', ')}',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           Text(
//             'x${item.quantity}',
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Text(
//             '£${item.totalPrice.toStringAsFixed(2)}',
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/view/home_view/home-screen/home_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Order? currentOrder;

  @override
  void initState() {
    super.initState();
    _loadDummyOrder(); // screen open hote hi dummy order load karega
  }

  void _loadDummyOrder() async {
    await Future.delayed(const Duration(seconds: 1)); // fake API delay

    setState(() {
      currentOrder = Order(
        orderId: DateTime.now().millisecondsSinceEpoch.toString(),
        customerName: "Ali Khan",
        customerPhone: "03001234567",
        deliveryAddress: "Islamabad, Pakistan",
        paymentMethod: "Cash on Delivery",
        totalAmount: 1500.00,
        statusText: "Pending",
        estimatedTimeText: "30-40 minutes",
        items: [
          CartItem(
            productName: "Burger",
            quantity: 2,
            totalPrice: 800.00,
            selectedOptions: [],
          ),
          CartItem(
            productName: "Fries",
            quantity: 1,
            totalPrice: 200.00,
            selectedOptions: [],
          ),
          CartItem(
            productName: "Pepsi",
            quantity: 2,
            totalPrice: 500.00,
            selectedOptions: [],
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('Order Tracking'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: currentOrder == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID Card
            _buildOrderIdCard(currentOrder!),

            const SizedBox(height: 20),

            // Estimated Delivery
            _buildEstimatedDelivery(currentOrder!),

            const SizedBox(height: 20),

            // Order Details
            _buildOrderDetails(currentOrder!),

            const SizedBox(height: 20),

            // Order Items
            _buildOrderItems(currentOrder!),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderIdCard(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            order.orderId,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Status: ${order.statusText}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEstimatedDelivery(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Estimated Delivery',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            order.estimatedTimeText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          _buildOrderInfoRow('Customer', order.customerName),
          _buildOrderInfoRow('Phone', order.customerPhone),
          _buildOrderInfoRow('Address', order.deliveryAddress),
          _buildOrderInfoRow('Payment', order.paymentMethod),
          _buildOrderInfoRow(
              'Total', '£${order.totalAmount.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildOrderItems(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Items',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...order.items.map((item) => _buildOrderItemRow(item)),
        ],
      ),
    );
  }

  Widget _buildOrderInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItemRow(CartItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (item.selectedOptions.isNotEmpty)
                  Text(
                    'Options: ${item.selectedOptions.map((o) => o.selectedItemName).join(', ')}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
          Text(
            'x${item.quantity}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '£${item.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}


class Order {
  final String orderId;
  final String customerName;
  final String customerPhone;
  final String deliveryAddress;
  final String paymentMethod;
  final double totalAmount;
  final String statusText;
  final String estimatedTimeText;
  final List<CartItem> items;

  Order({
    required this.orderId,
    required this.customerName,
    required this.customerPhone,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.totalAmount,
    required this.statusText,
    required this.estimatedTimeText,
    required this.items,
  });
}
class CartItem {
  final String productName;
  final int quantity;
  final double totalPrice;
  final List<CartOption> selectedOptions;

  CartItem({
    required this.productName,
    required this.quantity,
    required this.totalPrice,
    required this.selectedOptions,
  });
}

class CartOption {
  final String selectedItemName;

  CartOption({required this.selectedItemName});
}
