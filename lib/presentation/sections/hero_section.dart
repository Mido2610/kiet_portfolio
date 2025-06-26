import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:kiet_portfolio/core/utils/size.dart';
import 'package:kiet_portfolio/presentation/widgets/common/animated_button.dart';
import 'package:url_launcher/url_launcher.dart';
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
      child:
          isMobile
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
              child: HeroContentWidget(
                onNavigateToSection: onNavigateToSection,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder:
                (context, child) =>
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
          builder:
              (context, child) =>
                  Transform.scale(scale: scaleAnimation.value, child: child),
          child: const HeroAnimationWidget(),
        ),
        SizedBoxCommon.height40,
        AnimatedBuilder(
          animation: slideAnimation,
          builder:
              (context, child) => Transform.translate(
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

  const HeroContentWidget({super.key, required this.onNavigateToSection});

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
          l10n(context).hiThereIm,
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
        SizedBoxCommon.height16,
        Text(
          l10n(context).kietNguyen,
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
        SizedBoxCommon.height24,
        const HeroAnimatedTextWidget(),
        SizedBoxCommon.height32,
        const HeroDescriptionWidget(),
        SizedBoxCommon.height40,
        HeroCTAButtonsWidget(onNavigateToSection: onNavigateToSection),
        SizedBoxCommon.height32,
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
            [l10n(context).flutterDeveloper, l10n(context).frontEndDeveloper]
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
        l10n(context).heroDescription,
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
        textAlign:
            ResponsiveHelper.isMobile(context)
                ? TextAlign.center
                : TextAlign.start,
      ),
    );
  }
}

class HeroCTAButtonsWidget extends StatelessWidget {
  final Function(int) onNavigateToSection;

  const HeroCTAButtonsWidget({super.key, required this.onNavigateToSection});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AnimatedButton(
              text: l10n(context).viewMyWork,
              onPressed: () => onNavigateToSection(3),
              isPrimary: true,
              icon: Icons.work,
            ),
          ),
          SizedBoxCommon.height16,
          SizedBox(
            width: double.infinity,
            child: AnimatedButton(
              text: l10n(context).contactMe,
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
        Flexible(
          child: AnimatedButton(
            text: l10n(context).viewMyWork,
            onPressed: () => onNavigateToSection(3),
            isPrimary: true,
            icon: Icons.work,
          ),
        ),
        SizedBoxCommon.width20,
        Flexible(
          child: AnimatedButton(
            text: l10n(context).contactMe,
            onPressed: () => onNavigateToSection(5),
            isPrimary: false,
            icon: Icons.mail,
          ),
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
      {
        'iconType': 'svg',
        'iconPath': 'assets/icons/github.svg',
        'url': AppConstants.github,
        'label': l10n(context).github,
      },
      {
        'iconType': 'svg',
        'iconPath': 'assets/icons/linkedin.svg',
        'url': AppConstants.linkedin,
        'label': l10n(context).linkedin,
      },
      {
        'iconType': 'material',
        'icon': Icons.email,
        'url': 'mailto:${AppConstants.email}',
        'label': l10n(context).email,
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          socialLinks.map((social) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: HeroSocialLinkItemWidget(
                iconType: social['iconType'] as String,
                iconPath: social['iconPath'] as String?,
                icon: social['icon'] as IconData?,
                url: social['url'] as String,
                label: social['label'] as String,
              ),
            );
          }).toList(),
    );
  }
}

class HeroSocialLinkItemWidget extends HookWidget {
  final String iconType;
  final String? iconPath;
  final IconData? icon;
  final String url;
  final String label;

  const HeroSocialLinkItemWidget({
    super.key,
    required this.iconType,
    this.iconPath,
    this.icon,
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

    Future<void> launchUrlAction() async {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          // Fallback for email
          if (url.startsWith('mailto:')) {
            final emailUri = Uri(
              scheme: 'mailto',
              path: url.replaceAll('mailto:', ''),
            );
            await launchUrl(emailUri);
          }
        }
      } catch (e) {
        debugPrint('Could not launch $url: $e');
      }
    }

    return MouseRegion(
      onEnter: (_) => hoverController.forward(),
      onExit: (_) => hoverController.reverse(),
      child: AnimatedBuilder(
        animation: hoverAnimation,
        builder:
            (context, child) =>
                Transform.scale(scale: hoverAnimation.value, child: child),
        child: GestureDetector(
          onTap: launchUrlAction,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColors.accent.withAlpha((0.2 * 255).round()),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha((0.1 * 255).round()),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child:
                  iconType == 'svg' && iconPath != null
                      ? SvgPicture.asset(
                        iconPath!,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          AppColors.accent,
                          BlendMode.srcIn,
                        ),
                      )
                      : Icon(
                        icon ?? Icons.help,
                        color: AppColors.accent,
                        size: 24,
                      ),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/kiet.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.person, size: 100, color: AppColors.accent),
            );
          },
        ),
      ),
    );
  }
}