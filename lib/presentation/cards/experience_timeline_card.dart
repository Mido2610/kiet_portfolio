import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kiet_portfolio/core/themes/app_colors.dart';
import 'package:kiet_portfolio/presentation/widgets/common/glass_morphism_container.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../data/models/experience_model.dart';

class ExperienceTimelineCard extends HookWidget {
  final Experience experience;
  final bool isLeft;
  final bool showConnector;

  const ExperienceTimelineCard({
    super.key,
    required this.experience,
    required this.isLeft,
    this.showConnector = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final scaleAnim = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    final glowAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    final isMobile = ResponsiveUtils.isMobile(context);

    return MouseRegion(
      onEnter: (_) => controller.forward(),
      onExit: (_) => controller.reverse(),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) =>
            Transform.scale(scale: scaleAnim.value, child: child),
        child: isMobile
            ? ExperienceTimelineMobileCardWidget(
                experience: experience,
                glowAnimation: glowAnim,
              )
            : ExperienceTimelineDesktopCardWidget(
                experience: experience,
                isLeft: isLeft,
                glowAnimation: glowAnim,
              ),
      ),
    );
  }
}

class ExperienceTimelineMobileCardWidget extends StatelessWidget {
  final Experience experience;
  final Animation<double> glowAnimation;

  const ExperienceTimelineMobileCardWidget({
    super.key,
    required this.experience,
    required this.glowAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    
    return Row(
      children: [
        ExperienceTimelineNodeWidget(glowAnimation: glowAnimation),
        SizedBox(width: isMobile ? 12 : 20),
        Expanded(
          child: ExperienceCardContentWidget(
            experience: experience,
            glowAnimation: glowAnimation,
          ),
        ),
      ],
    );
  }
}

class ExperienceTimelineDesktopCardWidget extends StatelessWidget {
  final Experience experience;
  final bool isLeft;
  final Animation<double> glowAnimation;

  const ExperienceTimelineDesktopCardWidget({
    super.key,
    required this.experience,
    required this.isLeft,
    required this.glowAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveUtils.isTablet(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final spacing = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);
    
    return Row(
      children: isLeft
          ? [
              Expanded(
                child: ExperienceCardContentWidget(
                  experience: experience,
                  glowAnimation: glowAnimation,
                ),
              ),
              SizedBox(width: spacing),
              ExperienceTimelineNodeWidget(glowAnimation: glowAnimation),
              SizedBox(width: spacing),
              const Expanded(child: SizedBox()),
            ]
          : [
              const Expanded(child: SizedBox()),
              SizedBox(width: spacing),
              ExperienceTimelineNodeWidget(glowAnimation: glowAnimation),
              SizedBox(width: spacing),
              Expanded(
                child: ExperienceCardContentWidget(
                  experience: experience,
                  glowAnimation: glowAnimation,
                ),
              ),
            ],
    );
  }
}

class ExperienceTimelineNodeWidget extends StatelessWidget {
  final Animation<double> glowAnimation;

  const ExperienceTimelineNodeWidget({
    super.key,
    required this.glowAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer glow ring
            Container(
              width: 30 + (10 * glowAnimation.value),
              height: 30 + (10 * glowAnimation.value),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withAlpha((0.3 * 255 * glowAnimation.value).round()),
                    AppColors.accentLight.withAlpha((0.1 * 255 * glowAnimation.value).round()),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            
            // Middle ring
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accent.withAlpha((0.6 * 255).round()),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withAlpha((0.4 * 255 * glowAnimation.value).round()),
                    blurRadius: 8 + (8 * glowAnimation.value),
                    spreadRadius: 1 + (2 * glowAnimation.value),
                  ),
                ],
              ),
            ),
            
            // Inner core
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.accent, AppColors.accentLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withAlpha((0.8 * 255).round()),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            
            // Central dot
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ExperienceCardContentWidget extends StatelessWidget {
  final Experience experience;
  final Animation<double> glowAnimation;

  const ExperienceCardContentWidget({
    super.key,
    required this.experience,
    required this.glowAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    
    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        return GlassMorphismContainer(
          boxShadow: [
            BoxShadow(
              color: AppColors.accentLight.withAlpha(
                ((0.1 * 255).round() * glowAnimation.value).round(),
              ),
              blurRadius: 20 * glowAnimation.value,
              spreadRadius: 2 * glowAnimation.value,
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExperienceCardHeaderWidget(experience: experience),
                SizedBox(height: isMobile ? 8 : 12),
                ExperiencePositionWidget(position: experience.position),
                SizedBox(height: isMobile ? 6 : 8),
                ExperienceDurationWidget(duration: experience.duration),
                SizedBox(height: isMobile ? 12 : 16),
                ExperienceDescriptionWidget(description: experience.description),
                SizedBox(height: isMobile ? 12 : 16),
                ExperienceTechnologiesWidget(technologies: experience.technologies),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ExperienceCardHeaderWidget extends StatelessWidget {
  final Experience experience;

  const ExperienceCardHeaderWidget({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    
    final fontSize = ResponsiveUtils.getResponsiveFontSize(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );
    
    return Row(
      children: [
        if (experience.logoUrl.isNotEmpty) ...[
          ExperienceCompanyLogoWidget(
            logoUrl: experience.logoUrl,
            size: isMobile ? 36 : (isTablet ? 42 : 48),
          ),
          SizedBox(width: isMobile ? 8 : 12),
        ],
        Expanded(
          child: Text(
            experience.company,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            maxLines: isMobile ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ExperienceCompanyLogoWidget extends StatelessWidget {
  final String logoUrl;
  final double size;

  const ExperienceCompanyLogoWidget({
    super.key,
    required this.logoUrl,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          logoUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.business,
            color: AppColors.textTertiary,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}

class ExperiencePositionWidget extends StatelessWidget {
  final String position;

  const ExperiencePositionWidget({
    super.key,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveUtils.getResponsiveFontSize(
      context,
      mobile: 14,
      tablet: 15,
      desktop: 16,
    );
    
    return Text(
      position,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
      ),
    );
  }
}

class ExperienceDurationWidget extends StatelessWidget {
  final String duration;

  const ExperienceDurationWidget({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time, size: 16, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          duration,
          style: const TextStyle(fontSize: 14, color: AppColors.textTertiary),
        ),
      ],
    );
  }
}

class ExperienceDescriptionWidget extends StatelessWidget {
  final String description;

  const ExperienceDescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final fontSize = ResponsiveUtils.getResponsiveFontSize(
      context,
      mobile: 12,
      tablet: 13,
      desktop: 14,
    );
    
    return Text(
      description,
      style: TextStyle(
        fontSize: fontSize,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
      maxLines: isMobile ? 3 : 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ExperienceTechnologiesWidget extends StatelessWidget {
  final List<String> technologies;

  const ExperienceTechnologiesWidget({
    super.key,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: technologies.map((tech) {
        return ExperienceTechnologyChipWidget(technology: tech);
      }).toList(),
    );
  }
}

class ExperienceTechnologyChipWidget extends StatelessWidget {
  final String technology;

  const ExperienceTechnologyChipWidget({
    super.key,
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final fontSize = isMobile ? 10.0 : 12.0;
    final padding = EdgeInsets.symmetric(
      horizontal: isMobile ? 6 : 8, 
      vertical: isMobile ? 3 : 4,
    );
    
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.accent.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
        border: Border.all(
          color: AppColors.accent.withAlpha((0.3 * 255).round()),
          width: 1,
        ),
      ),
      child: Text(
        technology,
        style: TextStyle(
          color: AppColors.accent,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}