import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_theme.dart';

import '../../../controller/utils/constants/responsive-text-size.dart';


/// Professional App Bar with smooth animations and modern styling
class ProfessionalAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final bool automaticallyImplyLeading;
  final VoidCallback? onBackPressed;
  final Widget? flexibleSpace;
  final bool floating;
  final bool pinned;
  final double? expandedHeight;
  final double? collapsedHeight;
  final double? toolbarHeight;
  final bool showShadow;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final bool enableBlur;
  final double blurOpacity;

  const ProfessionalAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.centerTitle = false,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.automaticallyImplyLeading = true,
    this.onBackPressed,
    this.flexibleSpace,
    this.floating = false,
    this.pinned = false,
    this.expandedHeight,
    this.collapsedHeight,
    this.toolbarHeight,
    this.showShadow = true,
    this.borderRadius,
    this.padding,
    this.enableBlur = false,
    this.blurOpacity = 0.1,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ??
      (expandedHeight ?? kToolbarHeight) +
          (padding?.top ?? 0) +
          (padding?.bottom ?? 0));

  @override
  State<ProfessionalAppBar> createState() => _ProfessionalAppBarState();
}

class _ProfessionalAppBarState extends State<ProfessionalAppBar>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.elasticOut,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                (isDark ? Colors.grey[900] : Colors.white),
            borderRadius: widget.borderRadius,
            boxShadow: widget.showShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: BackdropFilter(
              filter: widget.enableBlur
                  ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
                  : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: (widget.backgroundColor ??
                          (isDark ? Colors.grey[900]! : Colors.white))
                      .withOpacity(1 - widget.blurOpacity),
                ),
                child: SafeArea(
                  child: Container(
                    height: widget.toolbarHeight ?? kToolbarHeight,
                    padding: widget.padding ??
                        const EdgeInsets.symmetric(horizontal: 16),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Row(
                          children: [
                            // Leading widget or back button
                            if (widget.leading != null)
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: widget.leading!,
                              )
                            else if (widget.showBackButton &&
                                widget.automaticallyImplyLeading)
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: _buildProfessionalBackButton(),
                              ),

                            const SizedBox(width: 12),

                            // Title section
                            Expanded(
                              child: _buildTitleSection(),
                            ),

                            // Actions
                            if (widget.actions != null) ...[
                              const SizedBox(width: 8),
                              ...widget.actions!.map(
                                (action) => ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: action,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfessionalBackButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: widget.onBackPressed ?? () => Get.back(),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: widget.foregroundColor ?? AppTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return widget.centerTitle
        ? Center(
            child: _buildTitleContent(),
          )
        : _buildTitleContent();
  }

  Widget _buildTitleContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: widget.centerTitle
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: FontSizeUtil.large(context) * 0.85,
            fontWeight: FontWeight.w600,
            color: widget.foregroundColor ?? AppTheme.textColor,
            letterSpacing: 0.2,
            height: 1.2,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (widget.subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            widget.subtitle!,
            style: TextStyle(
              fontSize: FontSizeUtil.small(context) * 0.75,
              color: (widget.foregroundColor ?? AppTheme.lightTextColor)
                  .withOpacity(0.7),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.1,
              height: 1.1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}

/// Professional Sliver App Bar with smooth animations
class ProfessionalSliverAppBar extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final bool automaticallyImplyLeading;
  final VoidCallback? onBackPressed;
  final Widget? flexibleSpace;
  final bool floating;
  final bool pinned;
  final double? expandedHeight;
  final double? collapsedHeight;
  final double? toolbarHeight;
  final bool showShadow;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final bool enableBlur;
  final double blurOpacity;
  final Widget? background;
  final bool stretch;

  const ProfessionalSliverAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.centerTitle = false,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.automaticallyImplyLeading = true,
    this.onBackPressed,
    this.flexibleSpace,
    this.floating = false,
    this.pinned = false,
    this.expandedHeight,
    this.collapsedHeight,
    this.toolbarHeight,
    this.showShadow = true,
    this.borderRadius,
    this.padding,
    this.enableBlur = false,
    this.blurOpacity = 0.1,
    this.background,
    this.stretch = false,
  });

  @override
  State<ProfessionalSliverAppBar> createState() =>
      _ProfessionalSliverAppBarState();
}

class _ProfessionalSliverAppBarState extends State<ProfessionalSliverAppBar>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      elevation: widget.elevation,
      floating: widget.floating,
      pinned: widget.pinned,
      expandedHeight: widget.expandedHeight,
      collapsedHeight: widget.collapsedHeight,
      toolbarHeight: widget.toolbarHeight ?? kToolbarHeight,
      stretch: widget.stretch,
      flexibleSpace: widget.flexibleSpace ?? _buildFlexibleSpace(),
      leading: widget.leading ?? _buildLeading(),
      title: _buildTitle(),
      centerTitle: widget.centerTitle,
      actions: widget.actions,
    );
  }

  Widget _buildFlexibleSpace() {
    return FlexibleSpaceBar(
      title: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: FontSizeUtil.large(context) * 0.8,
              fontWeight: FontWeight.w600,
              color: widget.foregroundColor ?? AppTheme.textColor,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              (widget.backgroundColor ?? Colors.white).withOpacity(0.9),
              (widget.backgroundColor ?? Colors.white).withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildLeading() {
    if (!widget.showBackButton || !widget.automaticallyImplyLeading) {
      return null;
    }

    return ScaleTransition(
      scale: _fadeAnimation,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.onBackPressed ,
                // ?? () => context.smoothBack(),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
                color: widget.foregroundColor ?? AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildTitle() {
    if (widget.subtitle == null) {
      return null;
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: widget.centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: FontSizeUtil.large(context) * 0.8,
                fontWeight: FontWeight.w600,
                color: widget.foregroundColor ?? AppTheme.textColor,
                letterSpacing: 0.2,
              ),
            ),
            if (widget.subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                widget.subtitle!,
                style: TextStyle(
                  fontSize: FontSizeUtil.small(context) * 0.7,
                  color: (widget.foregroundColor ?? AppTheme.lightTextColor)
                      .withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Professional Action Button for App Bar
class ProfessionalActionButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final String? tooltip;
  final bool showBadge;
  final int? badgeCount;
  final Color? badgeColor;

  const ProfessionalActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.tooltip,
    this.showBadge = false,
    this.badgeCount,
    this.badgeColor,
  });

  @override
  State<ProfessionalActionButton> createState() =>
      _ProfessionalActionButtonState();
}

class _ProfessionalActionButtonState extends State<ProfessionalActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip ?? '',
      child: GestureDetector(
        onTapDown: (_) => _scaleController.forward(),
        onTapUp: (_) => _scaleController.reverse(),
        onTapCancel: () => _scaleController.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ??
                  AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (widget.backgroundColor ?? AppTheme.primaryColor)
                    .withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: widget.onPressed,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        widget.icon,
                        size: widget.size ?? 20,
                        color: widget.iconColor ?? AppTheme.primaryColor,
                      ),
                    ),
                    if (widget.showBadge &&
                        widget.badgeCount != null &&
                        widget.badgeCount! > 0)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: widget.badgeColor ?? Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            widget.badgeCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
