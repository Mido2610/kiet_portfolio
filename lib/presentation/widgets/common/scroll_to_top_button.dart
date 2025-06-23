import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_utils.dart';
import 'dart:math' as math;

class ScrollToTopButton extends HookWidget {
  final ScrollController scrollController;
  final double showOffset;
  final Duration animationDuration;
  final Color buttonColor;
  final Color iconColor;

  const ScrollToTopButton({
    super.key,
    required this.scrollController,
    this.showOffset = 200,
    this.animationDuration = const Duration(milliseconds: 800),
    this.buttonColor = AppColors.accent,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final hoverController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final pulseController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    // Animation values
    final scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    final hoverScaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: hoverController, curve: Curves.easeInOut),
    );

    final pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );

    final rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: hoverController, curve: Curves.easeInOut),
    );

    // Listen to scroll changes
    useEffect(() {
      void listener() {
        if (scrollController.hasClients) {
          final offset = scrollController.offset;
          final shouldShow = offset > showOffset;

          if (shouldShow != isVisible.value) {
            isVisible.value = shouldShow;
            if (shouldShow) {
              animationController.forward();
              pulseController.repeat(reverse: true);
            } else {
              animationController.reverse();
              pulseController.stop();
            }
          }
        }
      }

      scrollController.addListener(listener);
      return () {
        scrollController.removeListener(listener);
        pulseController.dispose();
      };
    }, [scrollController]);

    final isMobile = ResponsiveUtils.isMobile(context);
    final buttonSize = isMobile ? 50.0 : 56.0;
    final iconSize = isMobile ? 24.0 : 28.0;

    return Positioned(
      right: isMobile ? 16 : 24,
      bottom: isMobile ? 20 : 32,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          scaleAnimation,
          hoverScaleAnimation,
          pulseAnimation,
          rotationAnimation,
        ]),
        builder: (context, child) {
          if (scaleAnimation.value == 0.0) {
            return const SizedBox.shrink();
          }

          return Transform.scale(
            scale: scaleAnimation.value * hoverScaleAnimation.value,
            child: MouseRegion(
              onEnter: (_) => hoverController.forward(),
              onExit: (_) => hoverController.reverse(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Pulse ring effect
                  AnimatedBuilder(
                    animation: pulseAnimation,
                    builder: (context, child) {
                      return Container(
                        width: buttonSize * pulseAnimation.value,
                        height: buttonSize * pulseAnimation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                                                      border: Border.all(
                              color: AppColors.accent.withAlpha(
                                (100 * (2.0 - pulseAnimation.value)).round(),
                              ),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentLight.withAlpha(
                                  (60 * (2.0 - pulseAnimation.value)).round(),
                                ),
                                blurRadius: 12 * (2.0 - pulseAnimation.value),
                                spreadRadius: 3 * (2.0 - pulseAnimation.value),
                              ),
                            ],
                        ),
                      );
                    },
                  ),

                  // Main button
                  Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.accent,
                          AppColors.accentLight,
                          AppColors.accent.withAlpha(200),
                        ],
                        stops: const [0.0, 0.6, 1.0],
                      ),
                      shape: BoxShape.circle,
                                              border: Border.all(
                          color: Colors.white.withAlpha(40),
                          width: 1.5,
                        ),
                                              boxShadow: [
                          BoxShadow(
                            color: AppColors.accent.withAlpha(100),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: AppColors.accentLight.withAlpha(80),
                            blurRadius: 35,
                            spreadRadius: 0,
                            offset: const Offset(0, 12),
                          ),
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(buttonSize / 2),
                        onTap: () {
                          scrollController.animateTo(
                            0.0,
                            duration: animationDuration,
                            curve: Curves.easeOutCubic,
                          );
                        },
                        child: Transform.rotate(
                          angle: rotationAnimation.value * math.pi * 0.1,
                          child: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: iconColor,
                            size: iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Glow effect on hover
                  if (hoverController.value > 0)
                    Container(
                      width: buttonSize + (15 * hoverController.value),
                      height: buttonSize + (15 * hoverController.value),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.accent.withAlpha(0),
                            AppColors.accent.withAlpha(
                              (50 * hoverController.value).round(),
                            ),
                            AppColors.accentLight.withAlpha(
                              (80 * hoverController.value).round(),
                            ),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.4, 0.7, 1.0],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollProgressIndicator extends HookWidget {
  final ScrollController scrollController;
  final Color progressColor;
  final double strokeWidth;

  const ScrollProgressIndicator({
    super.key,
    required this.scrollController,
    this.progressColor = AppColors.accent,
    this.strokeWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    final scrollProgress = useState(0.0);

    useEffect(() {
      void updateProgress() {
        if (scrollController.hasClients) {
          final maxScroll = scrollController.position.maxScrollExtent;
          final currentScroll = scrollController.offset;
          scrollProgress.value =
              maxScroll > 0 ? (currentScroll / maxScroll).clamp(0.0, 1.0) : 0.0;
        }
      }

      scrollController.addListener(updateProgress);
      return () => scrollController.removeListener(updateProgress);
    }, [scrollController]);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: strokeWidth,
        child: LinearProgressIndicator(
          value: scrollProgress.value,
          backgroundColor: progressColor.withAlpha((0.1 * 255).round()),
          valueColor: AlwaysStoppedAnimation(progressColor),
        ),
      ),
    );
  }
}

class ScrollToTopFloatingButton extends HookWidget {
  final ScrollController scrollController;
  final String tooltip;

  const ScrollToTopFloatingButton({
    super.key,
    required this.scrollController,
    this.tooltip = 'Scroll to top',
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);
    final isMobile = ResponsiveUtils.isMobile(context);

    useEffect(() {
      void listener() {
        if (scrollController.hasClients) {
          final shouldShow = scrollController.offset > 200;
          if (shouldShow != isVisible.value) {
            isVisible.value = shouldShow;
          }
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return Positioned(
      right: isMobile ? 16 : 30,
      bottom: isMobile ? 120 : 34,
      child: AnimatedScale(
        scale: isVisible.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        child: AnimatedOpacity(
          opacity: isVisible.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton(
            onPressed: () {
              scrollController.animateTo(
                0.0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
              );
            },
                          backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            tooltip: tooltip,
            elevation: 8,
            child: const Icon(Icons.keyboard_arrow_up_rounded, size: 28),
          ),
        ),
      ),
    );
  }
}