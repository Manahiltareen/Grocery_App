import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryapp_with_firebase/controller/components/CustomButton.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_theme.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/responsive-text-size.dart';




class SelectPaymentMethodScreen extends StatefulWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  State<SelectPaymentMethodScreen> createState() => _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  String? _selectedPaymentMethod; // State for the selected payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // White arrow back
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Select a payment method',
          style: TextStyle( // Custom style matching the image
            color: Colors.black,
            fontSize: FontSizeUtil.getFontSize(context, mobile: 18, tablet: 22, desktop: 26),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // <--- Corrected: Using primaryColor for the pink/red AppBar
        elevation: 0, // No shadow for AppBar
        centerTitle: false, // Title aligned to left
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Visa card option
            _buildPaymentOption(
              context,
              iconWidget: const FaIcon(FontAwesomeIcons.ccVisa, color: Colors.blue), // Visa icon
              title: 'Visa',
              subtitle: '.... 7621',
              value: 'Visa_7621',
              showPrimary: true, // "Primary" badge
              trailingWidget: Radio<String>(
                value: 'Visa_7621',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
                activeColor:AppTheme.blueColor, // Pink radio button when selected
                fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppTheme.blueColor; // Fill color when selected
                    }
                    return AppTheme.greyColor; // Border color when unselected
                  },
                ),
              ),
            ),
            // Easypaisa option
            _buildPaymentOption(
              context,
              iconWidget: const FaIcon(FontAwesomeIcons.wallet, color: Colors.green), // Green wallet icon for Easypaisa
              title: 'easypaisa',
              subtitle: '5427',
              value: 'Easypaisa_5427',
              trailingWidget: Radio<String>(
                value: 'Easypaisa_5427',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
                activeColor: AppTheme.blueColor, // Pink radio button
                fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppTheme.blueColor;
                    }
                    return AppTheme.greyColor;
                  },
                ),
              ),
            ),
            // Cash option
            _buildPaymentOption(
              context,
              iconWidget: const FaIcon(FontAwesomeIcons.moneyBillWave, color: Colors.grey), // Cash icon
              title: 'Cash',
              value: 'Cash',
              trailingWidget: Radio<String>(
                value: 'Cash',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
                activeColor: AppTheme.blueColor, // Pink radio button
                fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppTheme.blueColor;
                    }
                    return AppTheme.greyColor;
                  },
                ),
              ),
            ),
            // Credit or Debit Card (navigation option)
            _buildPaymentOption(
              context,
              iconWidget: const FaIcon(FontAwesomeIcons.creditCard, color: Colors.grey), // Credit card icon
              title: 'Credit or Debit Card',
              value: 'Credit_Debit_Card',
              trailingWidget: const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
              onTap: () {
                // Navigate to a screen to add/manage cards
                print('Navigate to Add/Manage Cards');
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardScreen()));
              },
            ),
            // JazzCash (navigation option)
            _buildPaymentOption(
              context,
              iconWidget: const FaIcon(FontAwesomeIcons.wallet, color: Colors.red), // Red wallet icon for JazzCash
              title: 'JazzCash',
              value: 'JazzCash',
              trailingWidget: const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
              onTap: () {
                // Navigate to JazzCash specific integration
                print('Navigate to JazzCash integration');
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => JazzCashScreen()));
              },
            ),
            // Another Easypaisa option (selectable)
            _buildPaymentOption(
              context,
              iconWidget: const FaIcon(FontAwesomeIcons.wallet, color: Colors.green), // Green wallet icon for Easypaisa
              title: 'easypaisa',
              value: 'Easypaisa_other', // If there can be multiple Easypaisa accounts
              trailingWidget: Radio<String>(
                value: 'Easypaisa_other',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
                activeColor: AppTheme.blueColor, // Pink radio button
                fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppTheme.blueColor;
                    }
                    return AppTheme.greyColor;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16.0),
        color: AppTheme.backgroundColor, // Background for the bottom sheet area
        child: SizedBox(
          width: double.infinity,
          child: CustomBlueButton(
            text: 'Confirm',
            onPressed: _selectedPaymentMethod != null
                ? () {
              // Pass the selected method back to the previous screen
              Navigator.pop(context, _selectedPaymentMethod);
            }
                : null, // Disable button if no method is selected
            backgroundColor: AppTheme.blueColor, // <--- Corrected: Using primaryColor for the pink/red Confirm button
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
      ),
    );
  }

  // Helper method to build each payment option row
  Widget _buildPaymentOption(
      BuildContext context, {
        IconData? icon, // Kept for flexibility, though iconWidget is preferred for FaIcons
        Widget? iconWidget, // Recommended for Font Awesome icons or custom widgets
        required String title,
        String? subtitle,
        required String value,
        Widget? trailingWidget,
        bool showPrimary = false,
        VoidCallback? onTap, // For navigation options like Credit Card or JazzCash
      }) {
    return GestureDetector(
      onTap: onTap ?? () {
        // If onTap is provided (for navigation options), use it.
        // Otherwise, assume it's a selectable option (like a Radio button).
        if (trailingWidget is Radio<String>) {
          setState(() {
            _selectedPaymentMethod = value;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 1.0), // Small gap between options
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        color: AppTheme.cardColor, // White background for the card
        child: Row(
          children: [
            // Use iconWidget if provided, otherwise fallback to IconData, then nothing
            if (iconWidget != null) iconWidget
            else if (icon != null) Icon(icon, color: AppTheme.textColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: FontSizeUtil.getFontSize(context, mobile: 16, tablet: 18, desktop: 22),
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: FontSizeUtil.getFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                        color: AppTheme.lightTextColor,
                      ),
                    ),
                ],
              ),
            ),
            if (showPrimary)
              Container(
                margin: const EdgeInsets.only(right: 8.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100, // Light blue background for "Primary"
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'Primary',
                  style: TextStyle(
                    fontSize: FontSizeUtil.getFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                    color: Colors.blue.shade700, // Darker blue text for "Primary"
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (trailingWidget != null) trailingWidget,
          ],
        ),
      ),
    );
  }
}