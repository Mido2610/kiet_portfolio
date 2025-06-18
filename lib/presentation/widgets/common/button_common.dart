import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/themes/app_colors.dart';

enum ButtonVariant { primary, secondary, outline, ghost }

enum ButtonSize { small, medium, large }

class ButtonCommon extends HookWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final double? width;

  const ButtonCommon({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
    );

    final buttonStyle = _getButtonStyle();
    final textStyle = _getTextStyle();
    final padding = _getPadding();

    return GestureDetector(
      onTapDown:
          isDisabled || isLoading ? null : (_) => animationController.forward(),
      onTapUp:
          isDisabled || isLoading ? null : (_) => animationController.reverse(),
      onTapCancel:
          isDisabled || isLoading ? null : () => animationController.reverse(),
      onTap: isDisabled || isLoading ? null : onPressed,
      child: Transform.scale(
        scale: scaleAnimation,
        child: Container(
          width: width,
          padding: padding,
          decoration: buttonStyle,
          child: _buildButtonContent(textStyle),
        ),
      ),
    );
  }

  Widget _buildButtonContent(TextStyle textStyle) {
    if (isLoading) {
      return SizedBox(
        height: _getButtonHeight(),
        child: const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.textPrimary),
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: _getIconSize(), color: textStyle.color),
          const SizedBox(width: 8),
        ],
        Text(text, style: textStyle),
      ],
    );
  }

  BoxDecoration _getButtonStyle() {
    switch (variant) {
      case ButtonVariant.primary:
        return BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.accent, AppColors.accentLight],
          ),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withAlpha((0.3 * 255).round()),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        );

      case ButtonVariant.secondary:
        return BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          border: Border.all(color: AppColors.surfaceLight, width: 1),
        );

      case ButtonVariant.outline:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          border: Border.all(color: AppColors.accent, width: 2),
        );

      case ButtonVariant.ghost:
        return BoxDecoration(
          color: AppColors.accent.withAlpha((0.1 * 255).round()),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
    }
  }

  TextStyle _getTextStyle() {
    final fontSize = _getFontSize();
    final fontWeight = FontWeight.w600;

    switch (variant) {
      case ButtonVariant.primary:
        return TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: AppColors.primary,
        );

      case ButtonVariant.secondary:
        return TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: AppColors.textPrimary,
        );

      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: AppColors.accent,
        );
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 14;
      case ButtonSize.medium:
        return 16;
      case ButtonSize.large:
        return 18;
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 18;
      case ButtonSize.large:
        return 20;
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case ButtonSize.small:
        return 20;
      case ButtonSize.medium:
        return 25;
      case ButtonSize.large:
        return 30;
    }
  }

  double _getButtonHeight() {
    switch (size) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 40;
      case ButtonSize.large:
        return 48;
    }
  }
}