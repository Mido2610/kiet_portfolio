import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/providers/core_provider.dart';
import 'package:kiet_portfolio/core/utils/common.dart';
import '../../../core/themes/app_colors.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);

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
        tooltip: '',
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
                currentLanguage == 'en'
                    ? l10n(context).englishLanguage
                    : l10n(context).vietnameseLanguage,
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
        onSelected: (String languageCode) async {
          // SỬ DỤNG CORE PROVIDER
          await ref.read(languageNotifierProvider).setLanguage(languageCode);
        },
        itemBuilder:
            (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'en',
                child: LanguageMenuItemWidget(
                  value: 'en',
                  flag: '🇺🇸',
                  label: l10n(context).englishLanguage,
                  isSelected: currentLanguage == 'en',
                ),
              ),
              PopupMenuItem<String>(
                value: 'vi',
                child: LanguageMenuItemWidget(
                  value: 'vi',
                  flag: '🇻🇳',
                  label: l10n(context).vietnameseLanguage,
                  isSelected: currentLanguage == 'vi',
                ),
              ),
            ],
      ),
    );
  }
}

class LanguageMenuItemWidget extends StatelessWidget {
  final String value;
  final String flag;
  final String label;
  final bool isSelected;

  const LanguageMenuItemWidget({
    super.key,
    required this.value,
    this.flag = '',
    this.label = '',
    this.isSelected = false,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}