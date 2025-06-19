import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kiet_portfolio/core/utils/responsive_utils.dart';
import 'package:kiet_portfolio/presentation/widgets/common/button_common.dart';
import '../../../core/themes/app_colors.dart';
import '../../../data/models/project_model.dart';
import '../widgets/common/glass_morphism_container.dart';

class ProjectShowcaseCard extends HookWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectShowcaseCard({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hoverController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    
    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: 1.02).animate(
        CurvedAnimation(
          parent: hoverController,
          curve: Curves.easeInOut,
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
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha(((0.1 * 255).round() * glowAnimation).round()),
                  blurRadius: 20 * glowAnimation,
                  spreadRadius: 2 * glowAnimation,
                ),
              ],
            ),
            child: GlassMorphismContainer(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProjectImage(context),
                  _buildProjectContent(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context) {
    return Container(
      height: ResponsiveUtils.isMobile(context) ? 180 : 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withAlpha((0.1 * 255).round()),
            AppColors.accentLight.withAlpha((0.1 * 255).round()),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              project.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholderImage();
              },
            ),
          ),
          _buildImageOverlay(),
          _buildProjectBadge(),
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppColors.surface,
      child: const Center(
        child: Icon(
          Icons.image,
          size: 48,
          color: AppColors.textTertiary,
        ),
      ),
    );
  }

  Widget _buildImageOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.primary.withAlpha((0.3 * 255).round()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectBadge() {
    return Positioned(
      top: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.accent,
              AppColors.accentLight,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withAlpha((0.3 * 255).round()),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          project.category.displayName,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProjectTitle(context),
          const SizedBox(height: 8),
          _buildProjectDescription(context),
          const SizedBox(height: 16),
          _buildTechnologyStack(),
          const SizedBox(height: 20),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildProjectTitle(BuildContext context) {
    return Text(
      project.title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontSize: ResponsiveUtils.getResponsiveFontSize(
          context,
          mobile: 18,
          tablet: 20,
          desktop: 22,
        ),
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProjectDescription(BuildContext context) {
    return Text(
      project.description,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.textSecondary,
        height: 1.5,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTechnologyStack() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: project.technologies.take(4).map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonCommon(
            text: 'View Details',
            onPressed: onTap ?? () {},
            variant: ButtonVariant.outline,
            size: ButtonSize.small,
          ),
        ),
        const SizedBox(width: 12),
        _buildExternalLinkButton(
          icon: Icons.open_in_new,
          url: project.liveUrl,
          tooltip: 'Live Demo',
        ),
        const SizedBox(width: 8),
        _buildExternalLinkButton(
          icon: Icons.code,
          url: project.githubUrl,
          tooltip: 'Source Code',
        ),
      ],
    );
  }

  Widget _buildExternalLinkButton({
    required IconData icon,
    required String url,
    required String tooltip,
  }) {
    return HookBuilder(
      builder: (context) {
        final buttonController = useAnimationController(
          duration: const Duration(milliseconds: 150),
        );
        
        final buttonScale = useAnimation(
          Tween<double>(begin: 1.0, end: 0.9).animate(buttonController),
        );

        return Tooltip(
          message: tooltip,
          child: GestureDetector(
            onTapDown: (_) => buttonController.forward(),
            onTapUp: (_) => buttonController.reverse(),
            onTapCancel: () => buttonController.reverse(),
            onTap: () {
              // Handle URL launch
            },
            child: Transform.scale(
              scale: buttonScale,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.accent.withAlpha((0.3 * 255).round()),
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: AppColors.accent,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}