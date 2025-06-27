import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollRevealAnimation extends HookWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final double slideDistance;
  final AnimationType animationType;
  final String uniqueKey;

  const ScrollRevealAnimation({
    super.key,
    required this.child,
    required this.uniqueKey,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.curve = Curves.easeOutCubic,
    this.slideDistance = 50.0,
    this.animationType = AnimationType.fadeInUp,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: duration,
    );

    final isVisible = useState(false);

    // Animation values based on type
    late final Animation<double> fadeAnimation;
    late final Animation<Offset> slideAnimation;
    late final Animation<double> scaleAnimation;

    switch (animationType) {
      case AnimationType.fadeInUp:
        fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        
        slideAnimation = Tween<Offset>(
          begin: Offset(0, slideDistance / 100),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        break;

      case AnimationType.fadeInLeft:
        fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        
        slideAnimation = Tween<Offset>(
          begin: Offset(-slideDistance / 100, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        break;

      case AnimationType.fadeInRight:
        fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        
        slideAnimation = Tween<Offset>(
          begin: Offset(slideDistance / 100, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        break;

      case AnimationType.fadeInScale:
        fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        
        scaleAnimation = Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        break;

      case AnimationType.fadeIn:
        fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: curve,
        ));
        break;
    }

    // Start animation when visible
    useEffect(() {
      if (isVisible.value) {
        Future.delayed(delay, () {
          if (animationController.isCompleted == false) {
            animationController.forward();
          }
        });
      }
      return null;
    }, [isVisible.value]);

    return VisibilityDetector(
      key: Key(uniqueKey),
      onVisibilityChanged: (info) {
        // Trigger animation when 20% of the widget is visible
        if (info.visibleFraction >= 0.2 && !isVisible.value) {
          isVisible.value = true;
        }
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          Widget animatedChild = this.child;

          // Apply animations based on type
          switch (animationType) {
            case AnimationType.fadeInUp:
            case AnimationType.fadeInLeft:
            case AnimationType.fadeInRight:
              animatedChild = SlideTransition(
                position: slideAnimation,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: animatedChild,
                ),
              );
              break;

            case AnimationType.fadeInScale:
              animatedChild = ScaleTransition(
                scale: scaleAnimation,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: animatedChild,
                ),
              );
              break;

            case AnimationType.fadeIn:
              animatedChild = FadeTransition(
                opacity: fadeAnimation,
                child: animatedChild,
              );
              break;
          }

          return animatedChild;
        },
      ),
    );
  }
}

enum AnimationType {
  fadeInUp,
  fadeInLeft,
  fadeInRight,
  fadeInScale,
  fadeIn,
}

// Staggered animation wrapper for multiple children
class StaggeredScrollReveal extends HookWidget {
  final List<Widget> children;
  final Duration duration;
  final Duration staggerDelay;
  final Curve curve;
  final AnimationType animationType;
  final String uniqueKey;

  const StaggeredScrollReveal({
    super.key,
    required this.children,
    required this.uniqueKey,
    this.duration = const Duration(milliseconds: 600),
    this.staggerDelay = const Duration(milliseconds: 100),
    this.curve = Curves.easeOutCubic,
    this.animationType = AnimationType.fadeInUp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;
        
        return ScrollRevealAnimation(
          uniqueKey: '${uniqueKey}_$index',
          duration: duration,
          delay: Duration(milliseconds: staggerDelay.inMilliseconds * index),
          curve: curve,
          animationType: animationType,
          child: child,
        );
      }).toList(),
    );
  }
}

// Section wrapper with reveal animation
class AnimatedSection extends HookWidget {
  final Widget child;
  final String sectionName;
  final AnimationType animationType;
  final Duration duration;
  final Duration delay;

  const AnimatedSection({
    super.key,
    required this.child,
    required this.sectionName,
    this.animationType = AnimationType.fadeInUp,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return ScrollRevealAnimation(
      uniqueKey: 'section_$sectionName',
      duration: duration,
      delay: delay,
      animationType: animationType,
      curve: Curves.easeOutCubic,
      slideDistance: 60.0,
      child: child,
    );
  }
} 