import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';

class CustomNavigationBar extends HookWidget {
  final int currentSection;
  final Function(int) onNavigateToSection;

  const CustomNavigationBar({
    super.key,
    required this.currentSection,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final isScrolled = useState(false);
    final isMobile = ResponsiveHelper.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color:
            isScrolled.value
                ? AppColors.surface.withAlpha((0.9 * 255).round())
                : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          if (!isMobile) _buildNavigationItems(),
          if (isMobile) _buildMobileMenuButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return const Text(
      'KN',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.accent,
      ),
    );
  }

  Widget _buildNavigationItems() {
    final sections = [
      'Home',
      'About',
      'Skills',
      'Projects',
      'Experience',
      'Contact',
    ];

    return Row(
      children:
          sections.asMap().entries.map((entry) {
            final index = entry.key;
            final title = entry.value;
            final isActive = index == currentSection;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _buildNavItem(
                title,
                isActive,
                () => onNavigateToSection(index),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildNavItem(String title, bool isActive, VoidCallback onTap) {
    return HookBuilder(
      builder: (context) {
        final hoverController = useAnimationController(
          duration: const Duration(milliseconds: 200),
        );

        final hoverAnimation = useAnimation(
          Tween<double>(begin: 1.0, end: 1.1).animate(hoverController),
        );

        return MouseRegion(
          onEnter: (_) => hoverController.forward(),
          onExit: (_) => hoverController.reverse(),
          child: Transform.scale(
            scale: hoverAnimation,
            child: GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color:
                      isActive
                          ? AppColors.accent.withOpacity(0.1)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border:
                      isActive
                          ? Border.all(color: AppColors.accent.withOpacity(0.3))
                          : null,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: isActive ? AppColors.accent : AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      onPressed: () {
        // TODO: Show mobile menu
      },
      icon: const Icon(Icons.menu, color: AppColors.textPrimary),
    );
  }
}