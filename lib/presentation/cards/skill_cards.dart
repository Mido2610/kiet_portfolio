import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiet_portfolio/presentation/widgets/common/glass_container.dart';
import '../../../core/themes/app_colors.dart';
import '../../../data/models/portfolio_state.dart';

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
        CurvedAnimation(
          parent: hoverController,
          curve: Curves.easeInOut,
        ),
      ),
    );

    final progressAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: skill.level).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    final glowAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: hoverController,
          curve: Curves.easeInOut,
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) => hoverController.forward(),
      onExit: (_) => hoverController.reverse(),
      child: Transform.scale(
        scale: scaleAnimation,
        child: GlassContainer(
          padding: const EdgeInsets.all(24),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha((0.2 * 255 * glowAnimation).round()),
                  blurRadius: 20 * glowAnimation,
                  spreadRadius: 2 * glowAnimation,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillIcon(),
                const SizedBox(height: 16),
                _buildSkillName(),
                const SizedBox(height: 12),
                _buildProgressBar(progressAnimation),
                const SizedBox(height: 8),
                _buildPercentage(),
                if (skill.description.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _buildDescription(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withAlpha((0.1 * 255).round()),
            AppColors.accent.withAlpha((0.2 * 255).round()),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accent.withAlpha((0.3 * 255).round()),
          width: 1,
        ),
      ),
      child: skill.iconPath.endsWith('.svg')
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                skill.iconPath,
                colorFilter: const ColorFilter.mode(
                  AppColors.accent,
                  BlendMode.srcIn,
                ),
              ),
            )
          : Icon(
              _getIconFromPath(skill.iconPath),
              color: AppColors.accent,
              size: 32,
            ),
    );
  }

  Widget _buildSkillName() {
    return Text(
      skill.name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildProgressBar(double progress) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress,
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.accent, AppColors.accentLight],
              ),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha((0.3 * 255).round()),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPercentage() {
    return Text(
      '${(skill.level * 100).toInt()}%',
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.accent,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      skill.description,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.textTertiary,
        height: 1.4,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  IconData _getIconFromPath(String path) {
    // Map icon paths to IconData
    final iconMap = {
      'flutter': Icons.flutter_dash,
      'dart': Icons.code,
      'firebase': Icons.cloud,
      'git': Icons.storage,
      'design': Icons.design_services,
      'api': Icons.api,
      'database': Icons.storage,
    };

    final iconKey = path.split('/').last.split('.').first.toLowerCase();
    return iconMap[iconKey] ?? Icons.code;
  }
}