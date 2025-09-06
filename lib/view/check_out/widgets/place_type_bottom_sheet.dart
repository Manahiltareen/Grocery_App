import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_theme.dart';
import 'package:groceryapp_with_firebase/view/check_out/save_new_address.dart';

class PlaceTypeBottomSheet extends StatefulWidget {
  const PlaceTypeBottomSheet({super.key});

  @override
  State<PlaceTypeBottomSheet> createState() => _PlaceTypeBottomSheetState();
}

class _PlaceTypeBottomSheetState extends State<PlaceTypeBottomSheet> {
  String? _selectedPlaceType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag indicator
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Header
          Text(
            'What type of place is this?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Help riders deliver your order with more accuracy.',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.lightTextColor,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),

          // Place type options
          _buildPlaceTypeOption(
            context,
            'House',
            'Stand-alone residential home',
            'House',
            Icons.home_outlined,
          ),
          _buildPlaceTypeOption(
            context,
            'Apartment',
            'Residential unit on a specific floor',
            'Apartment',
            Icons.apartment_outlined,
          ),
          _buildPlaceTypeOption(
            context,
            'Office',
            'Building used for professional work',
            'Office',
            Icons.business_outlined,
          ),
          _buildPlaceTypeOption(
            context,
            'Hotel',
            'Lodging with guest services',
            'Hotel',
            Icons.hotel_outlined,
          ),
          _buildPlaceTypeOption(
            context,
            'Other',
            'Park, mall, hospital, etc',
            'Other',
            Icons.place_outlined,
          ),
          const SizedBox(height: 24),

          // Continue button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: _selectedPlaceType == null
                    ? [Colors.grey.shade300, Colors.grey.shade300]
                    : [
                        AppTheme.primaryColor,
                        AppTheme.primaryColor.withOpacity(0.8)
                      ],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: _selectedPlaceType == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SaveNewAddressScreen(),
                          ),
                        );
                      },
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _selectedPlaceType == null
                          ? Colors.grey.shade600
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPlaceTypeOption(BuildContext context, String title,
      String subtitle, String value, IconData icon) {
    final bool isSelected = _selectedPlaceType == value;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              _selectedPlaceType = value;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryColor.withOpacity(0.2)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: isSelected
                        ? AppTheme.primaryColor
                        : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.lightTextColor,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
