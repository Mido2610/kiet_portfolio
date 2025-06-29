import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiet_portfolio/data/models/skill_model.dart';
import 'package:kiet_portfolio/presentation/widgets/common/glass_container.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';

class SkillCard extends HookWidget {
  final Skill skill;
  final AnimationController animationController;

  const SkillCard({
    super.key,
    required this.skill,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final hoverController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: 1.05).animate(
        CurvedAnimation(parent: hoverController, curve: Curves.easeInOut),
      ),
    );

    final glowAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: hoverController, curve: Curves.easeInOut),
      ),
    );

    return MouseRegion(
      onEnter: (_) => hoverController.forward(),
      onExit: (_) => hoverController.reverse(),
      child: Transform.scale(
        scale: scaleAnimation,
        child: GlassContainer(
          padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 16 : 24),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha(
                    (0.2 * 255 * glowAnimation).round(),
                  ),
                  blurRadius: 20 * glowAnimation,
                  spreadRadius: 2 * glowAnimation,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SkillIconWidget(skill: skill),
                SizedBox(height: ResponsiveHelper.isMobile(context) ? 12 : 16),
                Text(
                  skill.name,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                      context,
                      mobile: 14,
                      tablet: 16,
                      desktop: 18,
                    ),
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillIconWidget extends StatelessWidget {
  final Skill skill;
  const _SkillIconWidget({required this.skill});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final iconSize = isMobile ? 48.0 : 60.0;
    final iconPadding = isMobile ? 10.0 : 12.0;
    
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withAlpha((0.1 * 255).round()),
            AppColors.accent.withAlpha((0.2 * 255).round()),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
        border: Border.all(
          color: AppColors.accent.withAlpha((0.3 * 255).round()),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(iconPadding),
        child: SvgPicture.asset(skill.iconUrl),
      ),
    );
  }
}