import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/providers/core_provider.dart';
import '../../../core/themes/app_colors.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accent.withAlpha((0.2 * 255).round()),
          width: 1,
        ),
      ),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColors.surface,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language, color: AppColors.accent, size: 18),
              const SizedBox(width: 6),
              Text(
                currentLocale.languageCode.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
                size: 16,
              ),
            ],
          ),
        ),
        onSelected: (String languageCode) {
          ref.read(localeProvider.notifier).changeLocale(languageCode);
        },
        itemBuilder:
            (BuildContext context) => [
              _buildLanguageMenuItem(
                context,
                'en',
                '🇺🇸',
                'English',
                currentLocale.languageCode == 'en',
              ),
              _buildLanguageMenuItem(
                context,
                'vi',
                '🇻🇳',
                'Tiếng Việt',
                currentLocale.languageCode == 'vi',
              ),
            ],
      ),
    );
  }

  PopupMenuItem<String> _buildLanguageMenuItem(
    BuildContext context,
    String value,
    String flag,
    String label,
    bool isSelected,
  ) {
    return PopupMenuItem<String>(
      value: value,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.accent : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              const Spacer(),
              Icon(Icons.check, color: AppColors.accent, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}