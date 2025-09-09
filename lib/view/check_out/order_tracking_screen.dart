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
//   final Map<String, dynamic> order;
//   const OrderTrackingScreen({super.key, required this.order});
//
//   @override
//   Widget build(BuildContext context) {
//     final items = (order["items"] as List?) ?? [];
//     return Scaffold(
//       backgroundColor: const Color(0xFFFAFAFA),
//       appBar: AppBar(
//         title: const Text('Order Tracking'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const HomeScreen()),
//             );
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Order ID Card
//             _buildOrderIdCard(order),
//             const SizedBox(height: 20),
//             // Estimated Delivery (dummy for now)
//             _buildEstimatedDelivery(order),
//             const SizedBox(height: 20),
//             // Order Details
//             _buildOrderDetails(order),
//             const SizedBox(height: 20),
//             // Order Items
//             _buildOrderItems(items),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOrderIdCard(Map<String, dynamic> order) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: _boxDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Order ID', style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500)),
//           const SizedBox(height: 8),
//           Text(order["orderId"] ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
//           const SizedBox(height: 16),
//           Text('Status: ${order["status"] ?? ""}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.orange)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEstimatedDelivery(Map<String, dynamic> order) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: _boxDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text('Estimated Delivery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
//           SizedBox(height: 8),
//           Text('30-40 minutes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderDetails(Map<String, dynamic> order) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: _boxDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Order Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
//           const SizedBox(height: 16),
//           _buildOrderInfoRow('Customer', order["customerName"] ?? ''),
//           _buildOrderInfoRow('Phone', order["customerPhone"] ?? ''),
//           _buildOrderInfoRow('Address', order["deliveryAddress"] ?? ''),
//           _buildOrderInfoRow('Payment', order["paymentMethod"] ?? ''),
//           _buildOrderInfoRow('Total', '£${order["totalAmount"]?.toStringAsFixed(2) ?? ''}'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderItems(List items) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: _boxDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
//           const SizedBox(height: 16),
//           ...items.map((item) => _buildOrderItemRow(item)).toList(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
//           Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderItemRow(dynamic item) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item["productName"] ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                 if ((item["selectedOptions"] ?? []).isNotEmpty)
//                   Text('Options: ${(item["selectedOptions"] as List).map((o) => o["selectedItemName"]).join(", ")}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//               ],
//             ),
//           ),
//           Text('x${item["quantity"] ?? 1}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//           const SizedBox(width: 16),
//           Text('£${item["totalPrice"]?.toStringAsFixed(2) ?? ''}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
//
//   BoxDecoration _boxDecoration() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 10,
//           offset: const Offset(0, 2),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/view/home_view/home-screen/home_screen.dart';
import 'package:groceryapp_with_firebase/view/home_view/home-screen/home_screen1.dart';

class OrderTrackingScreen extends StatelessWidget {
  final Map<String, dynamic> order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final items = (order["items"] as List?) ?? [];
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
              MaterialPageRoute(builder: (context) => const HomeScreen1()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID Card
            _buildOrderIdCard(order),
            const SizedBox(height: 20),
            // Estimated Delivery (dummy for now)
            _buildEstimatedDelivery(order),
            const SizedBox(height: 20),
            // Order Details
            _buildOrderDetails(order),
            const SizedBox(height: 20),
            // Order Items
            _buildOrderItems(items),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderIdCard(Map<String, dynamic> order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order ID',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(order["orderId"] ?? '',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 16),
          Text('Status: ${order["status"] ?? ""}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange)),
        ],
      ),
    );
  }

  Widget _buildEstimatedDelivery(Map<String, dynamic> order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Estimated Delivery',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          SizedBox(height: 8),
          Text('30-40 minutes',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildOrderDetails(Map<String, dynamic> order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Details',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          const SizedBox(height: 16),
          _buildOrderInfoRow('Customer', order["customerName"] ?? ''),
          _buildOrderInfoRow('Phone', order["customerPhone"] ?? ''),
          Wrap(children: [_buildOrderInfoRow('Address', order["deliveryAddress"] ?? '')] ),
          _buildOrderInfoRow('Payment', order["paymentMethod"] ?? ''),
          _buildOrderInfoRow(
              'Total', '£${order["totalAmount"]?.toStringAsFixed(2) ?? ''}'),
        ],
      ),
    );
  }

  Widget _buildOrderItems(List items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Items',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          const SizedBox(height: 16),
          ...items.map((item) => _buildOrderItemRow(item)).toList(),
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
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          Text(value,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildOrderItemRow(dynamic item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["productName"] ?? '',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                if ((item["selectedOptions"] ?? []).isNotEmpty)
                  Text(
                      'Options: ${(item["selectedOptions"] as List).map((o) => o["selectedItemName"]).join(", ")}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          Text('x${item["quantity"] ?? 1}',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(width: 16),
          Text('£${item["totalPrice"]?.toStringAsFixed(2) ?? ''}',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
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
