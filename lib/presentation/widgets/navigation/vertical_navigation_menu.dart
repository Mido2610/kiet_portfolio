import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/gen/l10n/app_localizations.dart';
import 'package:kiet_portfolio/presentation/providers/portfolio_provider.dart';
import '../../../core/themes/app_colors.dart';

class VerticalNavigationMenu extends ConsumerWidget {
  final int currentSection;
  final Function(int) onNavigateToSection;

  const VerticalNavigationMenu({
    super.key,
    required this.currentSection,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMenuOpen = ref.watch(isMenuOpenProvider);
    final localizations = AppLocalizations.of(context)!;

    final sections = [
      localizations.home,
      localizations.about,
      localizations.skills,
      localizations.experience,
      localizations.contact,
    ];

    if (!isMenuOpen) return const SizedBox.shrink();

    return Stack(
      children: [
        // Backdrop để đóng menu khi nhấn ra ngoài
        Positioned.fill(
          child: GestureDetector(
            onTap: () => ref.read(portfolioProvider.notifier).toggleMenu(),
            child: Container(
              color: Colors.black.withAlpha((0.3 * 255).round()),
            ),
          ),
        ),
        
        // Menu content
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: 0,
          bottom: 0,
          right: 0,
          width: 250,
          child: Material(
            elevation: 16,
            color: AppColors.surface,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header với nút đóng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => ref.read(portfolioProvider.notifier).toggleMenu(),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.accent.withAlpha((0.1 * 255).round()),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.menu,
                              color: AppColors.accent,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Menu items
                    ...sections.asMap().entries.map((entry) {
                      final index = entry.key;
                      final title = entry.value;
                      final isActive = index == currentSection;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            ref.read(portfolioProvider.notifier).toggleMenu();
                            onNavigateToSection(index);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: isActive 
                                  ? AppColors.accent.withAlpha((0.1 * 255).round())
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: isActive
                                  ? Border.all(
                                      color: AppColors.accent.withAlpha((0.3 * 255).round()),
                                    )
                                  : null,
                            ),
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                color: isActive 
                                    ? AppColors.accent 
                                    : AppColors.textPrimary,
                                fontWeight: isActive 
                                    ? FontWeight.w600 
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}