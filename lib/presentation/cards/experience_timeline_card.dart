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
      end: 1.02,
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
        builder:
            (context, child) =>
                Transform.scale(scale: scaleAnim.value, child: child),
        child:
            isMobile ? _buildMobileCard(glowAnim) : _buildDesktopCard(glowAnim),
      ),
    );
  }

  Widget _buildMobileCard(Animation<double> glowAnim) {
    return Row(
      children: [
        _buildTimelineNode(glowAnim),
        const SizedBox(width: 20),
        Expanded(child: _buildExperienceCard(glowAnim)),
      ],
    );
  }

  Widget _buildDesktopCard(Animation<double> glowAnim) {
    return Row(
      children:
          isLeft
              ? [
                Expanded(child: _buildExperienceCard(glowAnim)),
                const SizedBox(width: 40),
                _buildTimelineNode(glowAnim),
                const SizedBox(width: 40),
                const Expanded(child: SizedBox()),
              ]
              : [
                const Expanded(child: SizedBox()),
                const SizedBox(width: 40),
                _buildTimelineNode(glowAnim),
                const SizedBox(width: 40),
                Expanded(child: _buildExperienceCard(glowAnim)),
              ],
    );
  }

  Widget _buildTimelineNode(Animation<double> glowAnim) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.accent, AppColors.accentLight],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withAlpha(
              ((0.3 * 255).round() * glowAnim.value).round(),
            ),
            blurRadius: 15 * glowAnim.value,
            spreadRadius: 3 * glowAnim.value,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(Animation<double> glowAnim) {
    return GlassMorphismContainer(
      boxShadow: [
        BoxShadow(
          color: AppColors.accentLight.withAlpha(
            ((0.1 * 255).round() * glowAnim.value).round(),
          ),
          blurRadius: 20 * glowAnim.value,
          spreadRadius: 2 * glowAnim.value,
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader(),
          const SizedBox(height: 12),
          _buildPosition(),
          const SizedBox(height: 8),
          _buildDuration(),
          const SizedBox(height: 16),
          _buildDescription(),
          const SizedBox(height: 16),
          _buildTechnologies(),
        ],
      ),
    );
  }

  Widget _buildCardHeader() {
    return Row(
      children: [
        if (experience.logoUrl.isNotEmpty)
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                experience.logoUrl,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => const Icon(
                      Icons.business,
                      color: AppColors.textTertiary,
                      size: 24,
                    ),
              ),
            ),
          ),
        if (experience.logoUrl.isNotEmpty) const SizedBox(width: 12),
        Expanded(
          child: Text(
            experience.company,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPosition() {
    return Text(
      experience.position,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
      ),
    );
  }

  Widget _buildDuration() {
    return Row(
      children: [
        const Icon(Icons.access_time, size: 16, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          experience.duration,
          style: const TextStyle(fontSize: 14, color: AppColors.textTertiary),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      experience.description,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTechnologies() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          experience.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha((0.1 * 255).round()),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.accent.withAlpha((0.3 * 255).round()),
                  width: 1,
                ),
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  color: AppColors.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
    );
  }
}