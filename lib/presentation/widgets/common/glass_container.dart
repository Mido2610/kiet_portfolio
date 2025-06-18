import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/themes/app_colors.dart';

class GlassContainer extends StatelessWidget {
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

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur = 10.0,
    this.opacity = 0.3,
    this.color,
    this.border,
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
                  color ?? AppColors.surface.withAlpha((255 * opacity).round()),
              borderRadius: borderRadius ?? BorderRadius.circular(20),
              border:
                  border ??
                  Border.all(
                    color: AppColors.accent.withAlpha((0.2 * 255).round()),
                    width: 1,
                  ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}