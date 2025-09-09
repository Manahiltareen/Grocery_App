import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/address_contreoller.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/cart_controller.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/payment_controller.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/productlist_Controller/orderComtroller.dart';

import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_theme.dart';
import 'package:groceryapp_with_firebase/linker/linker.dart';
import 'package:groceryapp_with_firebase/model/credit_card_model/credit_card_model.dart';
import 'package:groceryapp_with_firebase/view/check_out/order_tracking_screen.dart';

import 'package:groceryapp_with_firebase/view/check_out/select_payment_method_screen.dart';
import 'package:groceryapp_with_firebase/view/check_out/widgets/CheckoutTimeline.dart';
import 'package:groceryapp_with_firebase/view/check_out/widgets/place_type_bottom_sheet.dart';
import 'package:groceryapp_with_firebase/view/check_out/widgets/professional_app_bar.dart';
import 'package:groceryapp_with_firebase/view/home_view/profile-screen/my_address_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final int currentStep;

  const CheckoutScreen({
    super.key,
    this.currentStep = 3,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _leaveAtDoor = false;
  bool _saveForNextOrder = false;
  bool _changeIssuesToggle = false;

  String _selectedDeliveryOption = 'Standard';
  String _selectedTip = '';
  String _currentPaymentMethodDisplay = 'Cash';

  // Dummy user address data
  final String _userAddress = 'Qabristan Altaf Colony';
  final String _userCity = 'Lahore';
  final OrderController controller = Get.put(OrderController());
  final AddressController addressController = Get.put(AddressController());
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    addressController.fetchAddresses(); // ✅ load pehle se stored addresses
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: ProfessionalAppBar(
        title: "Checkout",
        backgroundColor: Colors.white,
        showShadow: true,
        centerTitle: true,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        actions: [
          ProfessionalActionButton(
            icon: Icons.help_outline_outlined,
            onPressed: () {
              // Help action
            },
            backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
            iconColor: AppTheme.primaryColor,
          ),
        ],
      ),
      body: Column(
        children: [
          // Timeline at the top
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CheckoutTimeline(
              currentStep: widget.currentStep,
              onStepChanged: (step) {
                // Handle timeline navigation if needed
              },
            ),
          ),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Address section
                  _buildDeliveryAddressSection(context),
                  const SizedBox(height: 16),

                  // Delivery Instructions section
                  // _buildDeliveryInstructionsSection(context),
                  // const SizedBox(height: 16),

                  // Delivery Options section
                  // _buildDeliveryOptionsSection(context),
                  // const SizedBox(height: 16),

                  // Tip section
                  // _buildTipSection(context),
                  // const SizedBox(height: 16),

                  // Payment Method section
                  _buildPaymentMethodSection(context),
                  const SizedBox(height: 16),

                  // Order Summary section
                  _buildOrderSummarySection(context),
                  const SizedBox(height: 160), // Space for bottom sheet
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  Widget _buildDeliveryAddressSection(BuildContext context) {
    final AddressController addressController = Get.find();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      color: AppTheme.primaryColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textColor,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.edit_outlined,
                      color: AppTheme.primaryColor, size: 18),
                  onPressed: () {
                    Get.to(MyAddressScreen());
                  },
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          ///  Address show with Obx
          Obx(() {
            if (addressController.addressList.isEmpty) {
              return Text(
                "No address saved yet",
                style: TextStyle(color: AppTheme.lightTextColor, fontSize: 13),
              );
            }

            final address = addressController.addressList.last;

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address["streetaddress"] ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${address["city"] ?? ""}, ${address["state"] ?? ""}, ${address["country"] ?? ""}",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.lightTextColor,
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 16),
          _buildTextField('Delivery instructions/Alternate phone number',
              'Add instructions...'),
          const SizedBox(height: 16),
          _buildToggleRow(
            context,
            'Change issues? You can ask the rider to top-up your wallet.',
            _changeIssuesToggle,
            (bool value) {
              setState(() {
                _changeIssuesToggle = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInstructionsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Instructions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField('Note to rider - e.g. landmark', 'Add a note...'),
          const SizedBox(height: 16),
          _buildToggleRow(
            context,
            'Leave at the door',
            _leaveAtDoor,
            (bool value) {
              setState(() {
                _leaveAtDoor = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOptionsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.delivery_dining_outlined,
                  color: AppTheme.primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Delivery Options',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDeliveryOption(context, 'Standard', '15 - 30 mins', ''),
          const SizedBox(height: 8),
          _buildDeliveryOption(context, 'Priority', '10 - 25 mins', '+ £70.00'),
        ],
      ),
    );
  }

  Widget _buildTipSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt_long_outlined,
                  color: AppTheme.primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Tip Your Rider',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '100% of the tips go directly to your rider. Swipe left to view more tip options.',
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.lightTextColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildTipOption(context, 'Not now', ''),
              _buildTipOption(context, '£50.00', '50'),
              _buildTipOption(context, '£100.00', '100'),
              _buildTipOption(context, '£200.00', '200'),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: _saveForNextOrder,
                  onChanged: (bool? value) {
                    setState(() {
                      _saveForNextOrder = value ?? false;
                    });
                  },
                  activeColor: AppTheme.primaryColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
                Expanded(
                  child: Text(
                    'Save for your next order',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.textColor,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    final String userId = GetStorage().read("uid");

    return FutureBuilder<CardModel?>(
      future: paymentController.getDefaultCard(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text("No default payment method selected"),
          );
        }

        final defaultCard = snapshot.data!;

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.credit_card_outlined,
                          color: AppTheme.primaryColor, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textColor,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      final selectedMethod = await Get.to(
                        const CreditcardScreen(),
                      );
                      if (selectedMethod != null && selectedMethod is String) {
                        setState(() {
                          _currentPaymentMethodDisplay = selectedMethod;
                        });
                      }
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 🔹 Default Card Info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.credit_card,
                            color: AppTheme.primaryColor, size: 20),
                        const SizedBox(width: 12),
                        Text(
                          "${defaultCard.cardType} - **** ${defaultCard.cardNumber.substring(defaultCard.cardNumber.length - 4)}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Expiry: ${defaultCard.expiryDate}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrderSummarySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description_outlined,
                  color: AppTheme.primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSummaryItem(
              context, '1x Chicken Steam Momos', '£479.20', AppTheme.textColor),
          const SizedBox(height: 12),
          Container(height: 1, color: Colors.grey.shade200),
          const SizedBox(height: 12),
          _buildSummaryItem(
              context, 'Subtotal', '£599.00', AppTheme.lightTextColor),
          _buildSummaryItem(
              context, 'Discount', '- £119.80', AppTheme.highlightRed),
          _buildSummaryItem(
              context, 'Standard delivery', '£75.00', AppTheme.lightTextColor),
          _buildSummaryItem(
              context, 'Platform Fee', '£7.99', AppTheme.lightTextColor),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              'By completing this order, I agree to all terms & conditions.',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.lightTextColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total (incl. fees and tax)',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.lightTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        // Handle see summary
                      },
                      child: Text(
                        'See summary',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '£562.19',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.highlightRed,
                      ),
                    ),
                    Text(
                      '£681.99',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.lightTextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor.withOpacity(0.8)
                  ],
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () async {
                    // Show loading dialog
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.orange),
                          ),
                        );
                      },
                    );

                    try {
                      // Get selected address (last one as example)
                      final address = addressController.addressList.isNotEmpty
                          ? addressController.addressList.last
                          : null;
                      if (address == null) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please add/select a delivery address.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      // Get cart items
                      final cartItems = cartController.cartItems
                          .map((item) => Map<String, dynamic>.from(item))
                          .toList();
                      if (cartItems.isEmpty) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Your cart is empty.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      // Calculate total
                      final totalAmount = cartController.totalPrice;
                      // Place order
                      final orderData = await controller.placeOrder(
                        customerName: address["name"] ?? "",
                        customerPhone: address["phone"] ?? "",
                        deliveryAddress:
                            "${address["streetaddress"] ?? ""}, ${address["city"] ?? ""}, ${address["state"] ?? ""}, ${address["country"] ?? ""}",
                        paymentMethod: _currentPaymentMethodDisplay,
                        totalAmount: totalAmount,
                        items: cartItems,
                        notes: _leaveAtDoor ? 'Leave at door' : null,
                      );
                      Navigator.pop(context);
                      if (orderData["error"] != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Error placing order: ${orderData["error"]}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      // Go to order tracking screen with orderData
                      Get.to(() => OrderTrackingScreen(order: orderData));
                    } catch (e) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error placing order: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 13,
              color: AppTheme.lightTextColor,
            ),
            filled: true,
            fillColor: const Color(0xFFF8F9FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppTheme.primaryColor, width: 1.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow(BuildContext context, String text, bool value,
      ValueChanged<bool> onChanged) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textColor,
                height: 1.4,
              ),
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.primaryColor,
            inactiveThumbColor: Colors.grey.shade400,
            inactiveTrackColor: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOption(
      BuildContext context, String option, String time, String price) {
    bool isSelected = _selectedDeliveryOption == option;
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? AppTheme.primaryColor.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            setState(() {
              _selectedDeliveryOption = option;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.lightTextColor,
                      ),
                    ),
                  ],
                ),
                if (price.isNotEmpty)
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTipOption(BuildContext context, String text, String value) {
    bool isSelected = _selectedTip == value;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              setState(() {
                _selectedTip = value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        isSelected ? AppTheme.primaryColor : AppTheme.textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
      BuildContext context, String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: AppTheme.textColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
