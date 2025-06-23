import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;
import '../../core/themes/app_colors.dart';

class ParallaxWidget extends HookWidget {
  final Widget child;
  final double parallaxOffset;
  final Axis direction;

  const ParallaxWidget({
    super.key,
    required this.child,
    this.parallaxOffset = 0.5,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: direction == Axis.vertical
          ? Offset(0, parallaxOffset)
          : Offset(parallaxOffset, 0),
      child: child,
    );
  }
}

class FloatingParticlesWidget extends HookWidget {
  final int particleCount;
  final Color particleColor;
  final double minSize;
  final double maxSize;
  final Duration animationDuration;

  const FloatingParticlesWidget({
    super.key,
    this.particleCount = 20,
    this.particleColor = AppColors.accentLight,
    this.minSize = 2.0,
    this.maxSize = 6.0,
    this.animationDuration = const Duration(seconds: 10),
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: animationDuration,
    );

    final particles = useMemoized(() {
      return List.generate(particleCount, (index) {
        return ParticleData(
          id: index,
          initialX: math.Random().nextDouble(),
          initialY: math.Random().nextDouble(),
          size: minSize + (math.Random().nextDouble() * (maxSize - minSize)),
          speedX: (math.Random().nextDouble() - 0.5) * 0.5,
          speedY: (math.Random().nextDouble() - 0.5) * 0.3,
          opacity: 0.3 + (math.Random().nextDouble() * 0.4),
        );
      });
    }, [particleCount]);

    useEffect(() {
      animationController.repeat();
      return () => animationController.dispose();
    }, []);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return CustomPaint(
          painter: FloatingParticlesPainter(
            particles: particles,
            animationValue: animationController.value,
            particleColor: particleColor,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class ParticleData {
  final int id;
  final double initialX;
  final double initialY;
  final double size;
  final double speedX;
  final double speedY;
  final double opacity;

  ParticleData({
    required this.id,
    required this.initialX,
    required this.initialY,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.opacity,
  });
}

class FloatingParticlesPainter extends CustomPainter {
  final List<ParticleData> particles;
  final double animationValue;
  final Color particleColor;

  FloatingParticlesPainter({
    required this.particles,
    required this.animationValue,
    required this.particleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    for (final particle in particles) {
      final x = (particle.initialX + (particle.speedX * animationValue)) * size.width;
      final y = (particle.initialY + (particle.speedY * animationValue)) * size.height;

      // Wrap around screen edges
      final wrappedX = x % size.width;
      final wrappedY = y % size.height;

      // Create gradient for each particle
      final gradient = RadialGradient(
        colors: [
          particleColor.withAlpha((particle.opacity * 255).round()),
          particleColor.withAlpha((particle.opacity * 127).round()),
          Colors.transparent,
        ],
      );

      final rect = Rect.fromCircle(
        center: Offset(wrappedX, wrappedY),
        radius: particle.size,
      );

      paint.shader = gradient.createShader(rect);

      canvas.drawCircle(
        Offset(wrappedX, wrappedY),
        particle.size,
        paint,
      );

      // Add subtle glow effect
      paint.shader = null;
      paint.color = particleColor.withAlpha((particle.opacity * 80).round());
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      
      canvas.drawCircle(
        Offset(wrappedX, wrappedY),
        particle.size * 1.5,
        paint,
      );
      
      paint.maskFilter = null;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}