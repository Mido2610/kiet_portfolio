import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;
import '../../core/themes/app_colors.dart';

class RippleWaveWidget extends HookWidget {
  final double scrollOffset;
  final bool isVisible;
  final Color waveColor;
  final double waveIntensity;

  const RippleWaveWidget({
    super.key,
    required this.scrollOffset,
    this.isVisible = true,
    this.waveColor = AppColors.accent,
    this.waveIntensity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 2000),
    );

    final waveAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    useEffect(() {
      if (isVisible) {
        animationController.repeat();
      } else {
        animationController.stop();
      }
      return null;
    }, [isVisible]);

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedBuilder(
        animation: waveAnimation,
        builder: (context, child) {
          return CustomPaint(
            painter: RippleWavePainter(
              waveAnimation: waveAnimation.value,
              scrollOffset: scrollOffset,
              waveColor: waveColor,
              waveIntensity: waveIntensity,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class RippleWavePainter extends CustomPainter {
  final double waveAnimation;
  final double scrollOffset;
  final Color waveColor;
  final double waveIntensity;

  RippleWavePainter({
    required this.waveAnimation,
    required this.scrollOffset,
    required this.waveColor,
    required this.waveIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Create multiple concentric ripple waves
    for (int i = 0; i < 3; i++) {
      final radius = (50.0 + (i * 30)) * waveIntensity;
      final animatedRadius =
          radius + (math.sin(waveAnimation + (i * 0.5)) * 15);
      final opacity =
          (0.8 - (i * 0.2)) * (1 - (scrollOffset * 0.001).clamp(0.0, 0.5));

      paint.color = waveColor.withAlpha(
        (opacity.clamp(0.0, 1.0) * 255).round(),
      );

      // Draw ripple circles
      canvas.drawCircle(Offset(centerX, centerY), animatedRadius, paint);

      // Draw flowing lines
      final path = Path();
      for (double angle = 0; angle < 2 * math.pi; angle += math.pi / 8) {
        final startRadius = animatedRadius - 10;
        final endRadius = animatedRadius + 10;

        final startX = centerX + math.cos(angle + waveAnimation) * startRadius;
        final startY = centerY + math.sin(angle + waveAnimation) * startRadius;
        final endX = centerX + math.cos(angle + waveAnimation) * endRadius;
        final endY = centerY + math.sin(angle + waveAnimation) * endRadius;

        path.moveTo(startX, startY);
        path.lineTo(endX, endY);
      }

      paint.strokeWidth = 1.0;
      paint.color = waveColor.withAlpha((opacity * 0.5 * 255).round());
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TimelineProgressWidget extends HookWidget {
  final double progress;
  final Color progressColor;
  final double lineWidth;

  const TimelineProgressWidget({
    super.key,
    required this.progress,
    this.progressColor = AppColors.accent,
    this.lineWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    final progressAnimation = Tween<double>(begin: 0.0, end: progress).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic),
    );

    useEffect(() {
      animationController.forward();
      return null;
    }, [progress]);

    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: TimelineProgressPainter(
            progress: progressAnimation.value,
            progressColor: progressColor,
            lineWidth: lineWidth,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class TimelineProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final double lineWidth;

  TimelineProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round;

    final centerX = size.width / 2;
    final progressHeight = size.height * progress;

    // Create gradient shader
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        progressColor,
        progressColor.withAlpha((0.8 * 255).round()),
        progressColor.withAlpha((0.6 * 255).round()),
      ],
    );

    paint.shader = gradient.createShader(
      Rect.fromLTWH(centerX - lineWidth / 2, 0, lineWidth, progressHeight),
    );

    // Draw main progress line
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, progressHeight), paint);

    // Add glow effect
    paint.shader = null;
    paint.color = progressColor.withAlpha((0.3 * 255).round());
    paint.strokeWidth = lineWidth * 2;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    canvas.drawLine(Offset(centerX, 0), Offset(centerX, progressHeight), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
