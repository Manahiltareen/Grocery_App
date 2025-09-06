import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_theme.dart';


class CheckoutTimeline extends StatefulWidget {
  final int currentStep;
  final Function(int)? onStepChanged;

  const CheckoutTimeline({
    super.key,
    required this.currentStep,
    this.onStepChanged,
  });

  @override
  State<CheckoutTimeline> createState() => _CheckoutTimelineState();
}

class _CheckoutTimelineState extends State<CheckoutTimeline>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> _steps = [
    {
      'title': 'Menu',
      'subtitle': 'Select your items',
      'icon': Icons.restaurant_menu,
    },
    {
      'title': 'Cart',
      'subtitle': 'Review your order',
      'icon': Icons.shopping_cart,
    },
    {
      'title': 'Checkout',
      'subtitle': 'Complete payment',
      'icon': Icons.payment,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(_steps.length, (index) {
          final isLast = index == _steps.length - 1;
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildStepItem(index),
                ),
                if (!isLast) _buildConnector(index),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepItem(int index) {
    final step = _steps[index];
    final isActive = widget.currentStep == index + 1;
    final isCompleted = widget.currentStep > index + 1;

    return GestureDetector(
      onTap: () => widget.onStepChanged?.call(index + 1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Step indicator with animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? AppTheme.primaryColor
                    : isActive
                        ? AppTheme.primaryColor
                        : Colors.grey[100],
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                isCompleted ? Icons.check : step['icon'],
                color: isCompleted
                    ? Colors.white
                    : isActive
                        ? Colors.white
                        : Colors.grey[500],
                size: 14,
              ),
            ),
            const SizedBox(height: 5),
            // Step title
            Text(
              step['title'],
              style: TextStyle(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isCompleted
                    ? AppTheme.primaryColor
                    : isActive
                        ? AppTheme.primaryColor
                        : Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnector(int index) {
    final isCompleted = widget.currentStep > index + 1;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: 25,
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isCompleted ? AppTheme.primaryColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
