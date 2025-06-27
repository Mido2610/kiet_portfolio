import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kiet_portfolio/core/themes/app_colors.dart';
import 'package:kiet_portfolio/core/utils/common.dart';
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
        SizedBox(width: isMobile ? 16 : 24),
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
    final spacing = isDesktop ? 50.0 : (isTablet ? 32.0 : 20.0);
    
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
        final isMobile = ResponsiveUtils.isMobile(context);
        final nodeSize = isMobile ? 32.0 : 36.0;
        final coreSize = isMobile ? 18.0 : 22.0;
        final dotSize = isMobile ? 7.0 : 8.0;
        
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer glow ring
            Container(
              width: nodeSize + (12 * glowAnimation.value),
              height: nodeSize + (12 * glowAnimation.value),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withAlpha((0.3 * 255 * glowAnimation.value).round()),
                    AppColors.accentLight.withAlpha((0.15 * 255 * glowAnimation.value).round()),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            
            // Middle ring
            Container(
              width: nodeSize - 4,
              height: nodeSize - 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accent.withAlpha((0.7 * 255).round()),
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withAlpha((0.5 * 255 * glowAnimation.value).round()),
                    blurRadius: 10 + (10 * glowAnimation.value),
                    spreadRadius: 2 + (3 * glowAnimation.value),
                  ),
                ],
              ),
            ),
            
            // Inner core
            Container(
              width: coreSize,
              height: coreSize,
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
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            
            // Central dot
            Container(
              width: dotSize,
              height: dotSize,
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
    final isTablet = ResponsiveUtils.isTablet(context);
    
    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        return GlassMorphismContainer(
          boxShadow: [
            BoxShadow(
              color: AppColors.accentLight.withAlpha(
                ((0.15 * 255).round() * glowAnimation.value).round(),
              ),
              blurRadius: 25 * glowAnimation.value,
              spreadRadius: 3 * glowAnimation.value,
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 20 : (isTablet ? 24 : 28)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExperienceCardHeaderWidget(experience: experience),
                SizedBox(height: isMobile ? 10 : (isTablet ? 14 : 16)),
                ExperiencePositionWidget(position: experience.position),
                SizedBox(height: isMobile ? 8 : (isTablet ? 10 : 12)),
                ExperienceDurationWidget(duration: experience.duration),
                SizedBox(height: isMobile ? 16 : (isTablet ? 20 : 24)),
                ExperienceDescriptionWidget(),
                SizedBox(height: isMobile ? 16 : (isTablet ? 20 : 24)),
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
      mobile: 18,
      tablet: 20,
      desktop: 22,
    );
    
    return Row(
      children: [
        if (experience.logoUrl.isNotEmpty) ...[
          ExperienceCompanyLogoWidget(
            logoUrl: experience.logoUrl,
            size: isMobile ? 42 : (isTablet ? 48 : 54),
          ),
          SizedBox(width: isMobile ? 10 : (isTablet ? 14 : 16)),
        ],
        Expanded(
          child: Text(
            experience.company,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: 0.5,
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
      mobile: 15,
      tablet: 16,
      desktop: 17,
    );
    
    return Text(
      position,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
        letterSpacing: 0.3,
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
    final isMobile = ResponsiveUtils.isMobile(context);
    
    return Row(
      children: [
        Icon(
          Icons.access_time, 
          size: isMobile ? 18 : 20, 
          color: AppColors.textTertiary,
        ),
        const SizedBox(width: 6),
        Text(
          duration,
          style: TextStyle(
            fontSize: isMobile ? 14 : 15,
            color: AppColors.textTertiary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ExperienceDescriptionWidget extends StatelessWidget {

  const ExperienceDescriptionWidget({
    super.key,
  });

  List<TextSpan> _parseDescriptionText(String text, TextStyle baseStyle) {
    final lines = text.split('\n');
    List<TextSpan> spans = [];
    
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;
      
      if (line.startsWith('•')) {
        // Add bullet point in black color
        spans.add(TextSpan(
          text: '• ',
          style: baseStyle.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ));
        
        // Add the rest of the text in normal style
        spans.add(TextSpan(
          text: '${line.substring(1).trim()}\n',
          style: baseStyle,
        ));
      } else {
        // Regular paragraph text
        spans.add(TextSpan(
          text: '$line${i < lines.length - 1 ? '\n' : ''}',
          style: baseStyle,
        ));
      }
    }
    
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final fontSize = ResponsiveUtils.getResponsiveFontSize(
      context,
      mobile: 12,
      tablet: 13,
      desktop: 14,
    );
    
    final baseStyle = TextStyle(
      fontSize: fontSize,
      color: AppColors.textSecondary,
      height: 1.5,
    );
    
    final descriptionText = l10n(context).experienceCompanyDescription;
    
    return RichText(
      text: TextSpan(
        children: _parseDescriptionText(descriptionText, baseStyle),
      ),
      maxLines: isMobile ? 6 : 8,
      overflow: TextOverflow.ellipsis,
    );
  }
}