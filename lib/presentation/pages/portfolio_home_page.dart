import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/presentation/sections/about_section.dart';
import 'package:kiet_portfolio/presentation/sections/contact_section.dart';
import 'package:kiet_portfolio/presentation/sections/work_experience_section.dart';
import 'package:kiet_portfolio/presentation/widgets/navigation/horizontal_navigation_bar.dart';
import 'package:kiet_portfolio/presentation/widgets/navigation/vertical_navigation_menu.dart';
import 'package:kiet_portfolio/presentation/widgets/common/scroll_to_top_button.dart';
import 'package:kiet_portfolio/presentation/animations/scroll_reveal_animation.dart';
import '../sections/hero_section.dart';
import '../sections/skills_section.dart';
import '../../core/themes/app_colors.dart';

class PortfolioHomePage extends HookConsumerWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  Container(
                    key: sectionKeys[1], 
                    child: AnimatedSection(
                      sectionName: 'about',
                      animationType: AnimationType.fadeInUp,
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 200),
                      child: const AboutSection(),
                    ),
                  ),

                  // Section 2: Skills
                  Container(
                    key: sectionKeys[2], 
                    child: AnimatedSection(
                      sectionName: 'skills',
                      animationType: AnimationType.fadeInScale,
                      duration: const Duration(milliseconds: 1200),
                      delay: const Duration(milliseconds: 300),
                      child: const SkillsSection(),
                    ),
                  ),

                  // Section 3: Experience
                  Container(
                    key: sectionKeys[3],
                    child: AnimatedSection(
                      sectionName: 'experience',
                      animationType: AnimationType.fadeInLeft,
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 400),
                      child: const WorkExperienceSection(),
                    ),
                  ),

                  // Section 4: Contact
                  Container(
                    key: sectionKeys[4], 
                    child: AnimatedSection(
                      sectionName: 'contact',
                      animationType: AnimationType.fadeInUp,
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 300),
                      child: const ContactSection(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scroll Progress Indicator
          ScrollProgressIndicator(
            scrollController: scrollController,
            progressColor: AppColors.accent,
            strokeWidth: 4.0,
          ),

          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HorizontalNavigationBar(
              currentSection: currentSection.value,
              onNavigateToSection:
                  (sectionIndex) => _navigateToSection(
                    scrollController,
                    sectionIndex,
                    context,
                  ),
            ),
          ),

          // Vertical Navigation Menu
          VerticalNavigationMenu(
            currentSection: currentSection.value,
            onNavigateToSection:
                (sectionIndex) =>
                    _navigateToSection(scrollController, sectionIndex, context),
          ),

          // Scroll to Top Button
          ScrollToTopFloatingButton(
            scrollController: scrollController,
            tooltip: 'Scroll to top',
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