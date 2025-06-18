import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/themes/app_colors.dart';

class GlassMorphismContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double blur;
  final double opacity;
  final Color? color;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const GlassMorphismContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur = 15.0,
    this.opacity = 0.1,
    this.color,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:
                  color ?? AppColors.surface.withAlpha((opacity * 255).round()),
              borderRadius: borderRadius ?? BorderRadius.circular(20),
              border:
                  border ??
                  Border.all(
                    color: AppColors.accent.withAlpha((0.2 * 255).round()),
                    width: 1,
                  ),
              boxShadow:
                  boxShadow ??
                  [
                    BoxShadow(
                      color: AppColors.primary.withAlpha((0.1 * 255).round()),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}