import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/themes/app_colors.dart';

class AnimatedButton extends HookWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;
  final double? width;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final hoverController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final isHovered = useState(false);

    final scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: hoverController, curve: Curves.easeInOut),
    );

    return MouseRegion(
      onEnter: (_) {
        isHovered.value = true;
        hoverController.forward();
      },
      onExit: (_) {
        isHovered.value = false;
        hoverController.reverse();
      },
      child: AnimatedBuilder(
        animation: scaleAnimation,
        builder:
            (context, child) => Transform.scale(
              scale: scaleAnimation.value,
              child: Container(
                width: width,
                height: 50,
                decoration: BoxDecoration(
                  gradient:
                      isPrimary
                          ? LinearGradient(
                            colors: [
                              AppColors.accent,
                              AppColors.accent.withAlpha((0.8 * 255).round()),
                            ],
                          )
                          : null,
                  color: isPrimary ? AppColors.black : Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColors.accent, width: 2),
                  boxShadow:
                      isHovered.value
                          ? [
                            BoxShadow(
                              color: AppColors.accent.withAlpha(
                                (0.3 * 255).round(),
                              ),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ]
                          : [],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPressed,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null) ...[
                            Icon(
                              icon,
                              size: 20,
                              color:
                                  isPrimary ? AppColors.blackText : AppColors.accent,
                            ),
                            const SizedBox(width: 8),
                          ],
                          Flexible(
                            child: Text(
                              text,
                              style: TextStyle(
                                color:
                                    isPrimary ? AppColors.blackText : AppColors.accent,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
