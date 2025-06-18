import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../core/themes/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class ContactSection extends HookWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ResponsiveHelper.getResponsivePadding(context),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 32,
                tablet: 40,
                desktop: 48,
              ),
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'I\'m always open to discussing new opportunities and interesting projects. Feel free to reach out!',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.accent, AppColors.accentLight],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'Contact Me',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}