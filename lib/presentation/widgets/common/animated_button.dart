import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/themes/app_colors.dart';

class AnimatedButton extends HookWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;
  final double? width;
  final double? height;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
    );

    return GestureDetector(
      onTapDown: (_) => animationController.forward(),
      onTapUp: (_) => animationController.reverse(),
      onTapCancel: () => animationController.reverse(),
      onTap: onPressed,
      child: Transform.scale(
        scale: scaleAnimation,
        child: Container(
          width: width,
          height: height ?? 50,
          decoration: BoxDecoration(
            gradient:
                isPrimary
                    ? const LinearGradient(
                      colors: [AppColors.accent, AppColors.accentLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : null,
            border:
                isPrimary
                    ? null
                    : Border.all(color: AppColors.accent, width: 2),
            borderRadius: BorderRadius.circular(25),
            boxShadow:
                isPrimary
                    ? [
                      BoxShadow(
                        color: AppColors.accent.withAlpha((0.3 * 255).round()),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ]
                    : null,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    color: isPrimary ? AppColors.primary : AppColors.accent,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  text,
                  style: TextStyle(
                    color: isPrimary ? AppColors.primary : AppColors.accent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}