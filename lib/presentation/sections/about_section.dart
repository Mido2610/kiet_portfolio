import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kiet_portfolio/presentation/animations/fade_in_up.dart';
import 'package:kiet_portfolio/presentation/animations/slide_in_left.dart';
import 'package:kiet_portfolio/presentation/animations/typing_animation.dart';
import 'package:kiet_portfolio/presentation/widgets/common/glass_container.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_utils.dart';

class AboutSection extends HookConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    final isVisible = useState(false);

    useEffect(() {
      void checkVisibility() {
        final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final screenHeight = MediaQuery.of(context).size.height;

          if (position.dy < screenHeight * 0.8 && !isVisible.value) {
            isVisible.value = true;
            animationController.forward();
          }
        }
      }

      WidgetsBinding.instance.addPostFrameCallback((_) => checkVisibility());
      return null;
    }, []);

    return Container(
      width: double.infinity,
      padding: ResponsiveUtils.getSectionPadding(context),
      child:
          ResponsiveUtils.isMobile(context)
              ? AboutMobileLayout(animationController: animationController)
              : AboutDesktopLayout(animationController: animationController),
    );
  }
}

class AboutDesktopLayout extends StatelessWidget {
  final AnimationController animationController;

  const AboutDesktopLayout({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: AboutImageSection(controller: animationController),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 3,
          child: AboutContentSection(controller: animationController),
        ),
      ],
    );
  }
}

class AboutMobileLayout extends StatelessWidget {
  final AnimationController animationController;

  const AboutMobileLayout({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutImageSection(controller: animationController),
        const SizedBox(height: 40),
        AboutContentSection(controller: animationController),
      ],
    );
  }
}

class AboutImageSection extends StatelessWidget {
  final AnimationController controller;

  const AboutImageSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Stack(
          children: [
            // Gradient Background
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.accent.withAlpha((0.1 * 255).round()),
                    AppColors.accentDark.withAlpha((0.2 * 255).round()),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Profile Image - Replaced with placeholder
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: AppColors.accent.withAlpha((0.3 * 255).round()),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            // Glass Overlay
            Positioned.fill(
              child: GlassContainer(
                opacity: 0.1,
                blur: 5,
                borderRadius: BorderRadius.circular(20),
                child: const SizedBox(),
              ),
            ),
            // Floating Elements
            const AboutFloatingElements(),
          ],
        ),
      ),
    );
  }
}

class AboutFloatingElements extends StatelessWidget {
  const AboutFloatingElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: SlideInLeft(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 800),
            child: AboutFloatingCard(
              icon: Icons.work_history,
              text: '1+ Years',
              subtitle: 'Experience',
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: SlideInLeft(
            delay: const Duration(milliseconds: 1200),
            duration: const Duration(milliseconds: 800),
            child: AboutFloatingCard(
              icon: Icons.code,
              text: '10+',
              subtitle: 'Technologies',
            ),
          ),
        ),
      ],
    );
  }
}

class AboutFloatingCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subtitle;

  const AboutFloatingCard({
    super.key,
    required this.icon,
    required this.text,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.accent, AppColors.accentLight],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutContentSection extends StatelessWidget {
  final AnimationController controller;

  const AboutContentSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          child: AboutSectionTitle(),
        ),
        const SizedBox(height: 32),
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: _DescriptionWidget(),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: _HightlightsWidget(),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: _PersonalInfoWidget(),
        ),
      ],
    );
  }
}

class AboutSectionTitle extends StatelessWidget {
  const AboutSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypingAnimation(
          text: 'About Me',
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 32,
              tablet: 40,
              desktop: 48,
            ),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          typingSpeed: const Duration(milliseconds: 100),
          delay: const Duration(milliseconds: 300),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentLight],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }




}


class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Passionate Flutter Developer',
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 20,
              tablet: 24,
              desktop: 28,
            ),
            fontWeight: FontWeight.w600,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I\'m a dedicated Flutter developer with over 3 years of experience creating beautiful, performant mobile applications. My journey started with a fascination for clean code and pixel-perfect designs, and has evolved into a passion for building user-centric digital experiences.',
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 16,
              tablet: 18,
              desktop: 18,
            ),
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I specialize in cross-platform mobile development, state management, and creating seamless user interfaces. When I\'m not coding, you\'ll find me exploring new technologies, contributing to open-source projects, or sharing knowledge with the developer community.',
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 16,
              tablet: 18,
              desktop: 18,
            ),
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _HightlightsWidget extends StatelessWidget {
  const _HightlightsWidget();

  @override
  Widget build(BuildContext context) {
    final highlights = [
      {'icon': Icons.mobile_friendly, 'text': 'Cross-Platform Development'},
      {'icon': Icons.speed, 'text': 'Performance Optimization'},
      {'icon': Icons.design_services, 'text': 'UI/UX Implementation'},
      {'icon': Icons.cloud, 'text': 'Backend Integration'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What I Do Best',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 20),
        AnimationLimiter(
          child: Column(
            children:
                highlights.asMap().entries.map((entry) {
                  final index = entry.key;
                  final highlight = entry.value;

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 300),
                    child: SlideAnimation(
                      verticalOffset: 20,
                      child: FadeInAnimation(
                        child: _HighlightItemWidget(
                          icon: highlight['icon'] as IconData,
                          text: highlight['text'] as String,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class _HighlightItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HighlightItemWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.accent, AppColors.accentLight],
              ),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 16),
          Icon(icon, color: AppColors.accent, size: 20),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoWidget extends StatelessWidget {
  const _PersonalInfoWidget();

  @override
  Widget build(BuildContext context) {
    final personalInfo = [
      {'label': 'Location', 'value': 'Ho Chi Minh City, Vietnam'},
      {'label': 'Languages', 'value': 'Vietnamese, English'},
      {'label': 'Interests', 'value': 'Technology, Design, Travel'},
      {'label': 'Status', 'value': 'Available for Freelance'},
    ];

    return GlassContainer(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          ...personalInfo.map((info) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      '${info['label']}:',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      info['value']!,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}