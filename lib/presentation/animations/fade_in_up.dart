import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeInUp extends HookWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offset;
  final Curve curve;

  const FadeInUp({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.offset = 50.0,
    this.curve = Curves.easeOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);

    final slideAnimation = Tween<Offset>(
      begin: Offset(0, offset / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    useEffect(() {
      Future.delayed(delay, () {
        if (!controller.isAnimating && !controller.isCompleted) {
          controller.forward();
        }
      });
      return null;
    }, []);

    return AnimatedBuilder(
      animation: controller,
      builder:
          (context, child) => SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          ),
      child: child,
    );
  }
}