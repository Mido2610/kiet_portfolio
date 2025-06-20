import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:kiet_portfolio/presentation/widgets/common/animated_button.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/common.dart';

class HeroSection extends HookConsumerWidget {
  final Function(int) onNavigateToSection;

  const HeroSection({super.key, required this.onNavigateToSection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
      ),
    );
    final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    useEffect(() {
      controller.forward();
      return null;
    }, []);

    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getResponsivePadding(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: padding,
      child: isMobile
          ? HeroMobileLayoutWidget(
              fadeAnimation: fadeAnimation,
              slideAnimation: slideAnimation,
              scaleAnimation: scaleAnimation,
              onNavigateToSection: onNavigateToSection,
            )
          : HeroDesktopLayoutWidget(
              fadeAnimation: fadeAnimation,
              slideAnimation: slideAnimation,
              scaleAnimation: scaleAnimation,
              onNavigateToSection: onNavigateToSection,
            ),
    );
  }
}

class HeroDesktopLayoutWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;
  final Function(int) onNavigateToSection;

  const HeroDesktopLayoutWidget({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
    required this.scaleAnimation,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: HeroContentWidget(onNavigateToSection: onNavigateToSection),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, child) =>
                Transform.scale(scale: scaleAnimation.value, child: child),
            child: const HeroAnimationWidget(),
          ),
        ),
      ],
    );
  }
}

class HeroMobileLayoutWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;
  final Function(int) onNavigateToSection;

  const HeroMobileLayoutWidget({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
    required this.scaleAnimation,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: scaleAnimation,
          builder: (context, child) =>
              Transform.scale(scale: scaleAnimation.value, child: child),
          child: const HeroAnimationWidget(),
        ),
        const SizedBox(height: 40),
        AnimatedBuilder(
          animation: slideAnimation,
          builder: (context, child) => Transform.translate(
            offset: slideAnimation.value,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          ),
          child: HeroContentWidget(onNavigateToSection: onNavigateToSection),
        ),
      ],
    );
  }
}

class HeroContentWidget extends StatelessWidget {
  final Function(int) onNavigateToSection;

  const HeroContentWidget({
    super.key,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final textAlign = isMobile ? TextAlign.center : TextAlign.start;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.hiThereIm,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(
              context,
              mobile: 20,
              tablet: 24,
              desktop: 28,
            ),
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          l10n.kietNguyen,
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(
              context,
              mobile: 48,
              tablet: 60,
              desktop: 72,
            ),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.1,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 24),
        const HeroAnimatedTextWidget(),
        const SizedBox(height: 32),
        const HeroDescriptionWidget(),
        const SizedBox(height: 40),
        HeroCTAButtonsWidget(onNavigateToSection: onNavigateToSection),
        const SizedBox(height: 32),
        const HeroSocialLinksWidget(),
      ],
    );
  }
}

class HeroAnimatedTextWidget extends StatelessWidget {
  const HeroAnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.isMobile(context) ? 60 : 80,
      child: AnimatedTextKit(
        animatedTexts:
            [l10n.flutterDeveloper, l10n.mobileAppDeveloper, l10n.uiUxEnthusiast]
                .map(
                  (text) => TypewriterAnimatedText(
                    text,
                    textStyle: TextStyle(
                      fontSize: ResponsiveHelper.getResponsiveFontSize(
                        context,
                        mobile: 24,
                        tablet: 28,
                        desktop: 32,
                      ),
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                )
                .toList(),
        repeatForever: true,
        pause: const Duration(milliseconds: 1500),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}

class HeroDescriptionWidget extends StatelessWidget {
  const HeroDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: ResponsiveHelper.isMobile(context) ? double.infinity : 600,
      ),
      child: Text(
        l10n.heroDescription,
        style: TextStyle(
          fontSize: ResponsiveHelper.getResponsiveFontSize(
            context,
            mobile: 16,
            tablet: 18,
            desktop: 20,
          ),
          color: AppColors.textSecondary,
          height: 1.6,
        ),
        textAlign: ResponsiveHelper.isMobile(context)
            ? TextAlign.center
            : TextAlign.start,
      ),
    );
  }
}

class HeroCTAButtonsWidget extends StatelessWidget {
  final Function(int) onNavigateToSection;

  const HeroCTAButtonsWidget({
    super.key,
    required this.onNavigateToSection,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AnimatedButton(
              text: l10n.viewMyWork,
              onPressed: () => onNavigateToSection(3),
              isPrimary: true,
              icon: Icons.work,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AnimatedButton(
              text: l10n.contactMe,
              onPressed: () => onNavigateToSection(5),
              isPrimary: false,
              icon: Icons.mail,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        AnimatedButton(
          text: l10n.viewMyWork,
          onPressed: () => onNavigateToSection(3),
          isPrimary: true,
          icon: Icons.work,
          width: 180,
        ),
        const SizedBox(width: 20),
        AnimatedButton(
          text: l10n.contactMe,
          onPressed: () => onNavigateToSection(5),
          isPrimary: false,
          icon: Icons.mail,
          width: 160,
        ),
      ],
    );
  }
}

class HeroSocialLinksWidget extends StatelessWidget {
  const HeroSocialLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final socialLinks = [
      {'icon': Icons.code, 'url': AppConstants.github, 'label': l10n.github},
      {'icon': Icons.work, 'url': AppConstants.linkedin, 'label': l10n.linkedin},
      {
        'icon': Icons.email,
        'url': 'mailto:${AppConstants.email}',
        'label': l10n.email,
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialLinks.map((social) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: HeroSocialLinkItemWidget(
            icon: social['icon'] as IconData,
            url: social['url'] as String,
            label: social['label'] as String,
          ),
        );
      }).toList(),
    );
  }
}

class HeroSocialLinkItemWidget extends HookWidget {
  final IconData icon;
  final String url;
  final String label;

  const HeroSocialLinkItemWidget({
    super.key,
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final hoverController = useAnimationController(
      duration: AppConstants.fastDuration,
    );

    final hoverAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(hoverController);

    return MouseRegion(
      onEnter: (_) => hoverController.forward(),
      onExit: (_) => hoverController.reverse(),
      child: AnimatedBuilder(
        animation: hoverAnimation,
        builder: (context, child) => Transform.scale(
          scale: hoverAnimation.value,
          child: child,
        ),
        child: GestureDetector(
          onTap: () {
            // Handle URL launch
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColors.accent.withAlpha(
                  (0.2 * 255).round(),
                ),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha(
                    (0.1 * 255).round(),
                  ),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: AppColors.accent,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationWidget extends StatelessWidget {
  const HeroAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Lottie.asset(
        'assets/animations/developer.json',
        fit: BoxFit.contain,
        repeat: true,
        animate: true,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 400,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.animation, size: 100, color: AppColors.accent),
          );
        },
      ),
    );
  }
}