import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/l10n/localization.dart';
import 'package:kiet_portfolio/presentation/sections/about_section.dart';
import 'package:kiet_portfolio/presentation/sections/contact_section.dart';
import 'package:kiet_portfolio/presentation/widgets/navigation/custom_navbar.dart';
import '../sections/hero_section.dart';
import '../sections/skills_section.dart';
import '../../core/themes/app_colors.dart';

class PortfolioHomePage extends HookConsumerWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        Localization().init(context);
    final scrollController = useScrollController();
    final sectionKeys = useMemoized(
      () => List.generate(6, (index) => GlobalKey()),
    );
    final currentSection = useState(0);

    // Listen to scroll to update current section
    useEffect(() {
      void onScroll() {
        final scrollOffset = scrollController.offset;
        final screenHeight = MediaQuery.of(context).size.height;

        int newSection = (scrollOffset / screenHeight).round();
        if (newSection != currentSection.value &&
            newSection >= 0 &&
            newSection < 6) {
          currentSection.value = newSection;
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary,
                  AppColors.primaryLight,
                  AppColors.primary,
                ],
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  // Section 0: Hero
                  Container(
                    key: sectionKeys[0],
                    child: HeroSection(
                      onNavigateToSection:
                          (sectionIndex) => _navigateToSection(
                            scrollController,
                            sectionIndex,
                            context,
                          ),
                    ),
                  ),

                  // Section 1: About Me
                  Container(key: sectionKeys[1], child: const AboutSection()),

                  // Section 2: Skills
                  Container(key: sectionKeys[2], child: const SkillsSection()),

                  // Section 4: Experience
                  // Container(
                  //   key: sectionKeys[4],
                  //   child: const WorkExperienceSection(),
                  // ),

                  // Section 5: Contact
                  Container(key: sectionKeys[5], child: const ContactSection()),
                ],
              ),
            ),
          ),

          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(
              currentSection: currentSection.value,
              onNavigateToSection:
                  (sectionIndex) => _navigateToSection(
                    scrollController,
                    sectionIndex,
                    context,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToSection(
    ScrollController scrollController,
    int sectionIndex,
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetOffset = sectionIndex * screenHeight;

    scrollController.animateTo(
      targetOffset.toDouble(),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}