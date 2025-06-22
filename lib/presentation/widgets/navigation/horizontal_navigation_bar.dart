import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/gen/l10n/app_localizations.dart';
import 'package:kiet_portfolio/presentation/providers/portfolio_provider.dart';
import 'package:kiet_portfolio/presentation/widgets/common/language_switcher.dart';
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
          const _LogoWidget(),
          if (!isMobile) ...[
            NavigationItemsWidget(
              currentSection: currentSection,
              onNavigateToSection: onNavigateToSection,
            ),
            const LanguageSwitcher(),
          ],
          if (isMobile) ...[
            Row(
              children: [
                const LanguageSwitcher(),
                const SizedBox(width: 12),
                const MobileMenuButtonWidget(),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'KN',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.accent,
      ),
    );
  }
}

class NavigationItemsWidget extends StatelessWidget {
  final int currentSection;
  final Function(int) onNavigateToSection;

  const NavigationItemsWidget({
    super.key,
    required this.currentSection,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final sections = [
      localizations.home,
      localizations.about,
      localizations.skills,
      localizations.experience,
      localizations.contact,
    ];

    return Row(
      children:
          sections.asMap().entries.map((entry) {
            final index = entry.key;
            final title = entry.value;
            final isActive = index == currentSection;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: NavigationItemWidget(
                title: title,
                isActive: isActive,
                onTap: () => onNavigateToSection(index),
              ),
            );
          }).toList(),
    );
  }
}

class NavigationItemWidget extends HookWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const NavigationItemWidget({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color:
                  isActive
                      ? AppColors.accent.withAlpha((0.1 * 255).round())
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border:
                  isActive
                      ? Border.all(
                        color: AppColors.accent.withAlpha((0.3 * 255).round()),
                      )
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
  }
}

class MobileMenuButtonWidget extends ConsumerWidget {
  const MobileMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMenuOpen = ref.watch(isMenuOpenProvider);

    return GestureDetector(
      onTap: () => ref.read(portfolioProvider.notifier).toggleMenu(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.accent.withAlpha((0.2 * 255).round()),
            width: 1,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            isMenuOpen ? Icons.close : Icons.menu,
            key: ValueKey(isMenuOpen),
            color: AppColors.textPrimary,
            size: 24,
          ),
        ),
      ),
    );
  }
}