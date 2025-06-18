import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kiet_portfolio/data/models/portfolio_state.dart';
import 'package:kiet_portfolio/presentation/cards/skill_cards.dart';
import 'package:kiet_portfolio/presentation/providers/portfolio_provider.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';

import '../animations/fade_in_up.dart';

class SkillsSection extends HookConsumerWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioState = ref.watch(portfolioProvider);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 2000),
    );

    final isVisible = useState(false);
    final selectedCategory = useState('All');

    final skillCategories = ['All', 'Frontend', 'Backend', 'Tools', 'Design'];

    useEffect(() {
      void checkVisibility() {
        if (!isVisible.value) {
          isVisible.value = true;
          animationController.forward();
        }
      }

      WidgetsBinding.instance.addPostFrameCallback((_) => checkVisibility());
      return null;
    }, []);

    return Container(
      width: double.infinity,
      padding: ResponsiveHelper.getResponsivePadding(context),
      child: Column(
        children: [
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: _buildSectionHeader(context),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: _buildCategoryFilter(skillCategories, selectedCategory),
          ),
          const SizedBox(height: 60),
          if (portfolioState.isLoading)
            const CircularProgressIndicator(color: AppColors.accent)
          else
            _buildSkillsGrid(
              context,
              _getFilteredSkills(portfolioState.skills, selectedCategory.value),
              animationController,
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'Skills & Technologies',
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
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentLight],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'Here are the technologies and tools I use to bring ideas to life. I\'m always learning and expanding my skillset.',
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 16,
                tablet: 18,
                desktop: 18,
              ),
              color: AppColors.textSecondary,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter(
    List<String> categories,
    ValueNotifier<String> selectedCategory,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            categories.map((category) {
              final isSelected = selectedCategory.value == category;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _buildCategoryChip(category, isSelected, () {
                  selectedCategory.value = category;
                }),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildCategoryChip(
    String category,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return HookBuilder(
      builder: (context) {
        final hoverController = useAnimationController(
          duration: const Duration(milliseconds: 200),
        );

        final hoverAnimation = useAnimation(
          Tween<double>(begin: 1.0, end: 1.05).animate(hoverController),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  gradient:
                      isSelected
                          ? const LinearGradient(
                            colors: [AppColors.accent, AppColors.accentLight],
                          )
                          : null,
                  color: isSelected ? null : AppColors.surface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color:
                        isSelected
                            ? Colors.transparent
                            : AppColors.accent.withAlpha((0.3 * 255).round()),
                    width: 1,
                  ),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(
                              color: AppColors.accent.withAlpha((0.3 * 255).round()),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ]
                          : null,
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color:
                        isSelected ? AppColors.primary : AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillsGrid(
    BuildContext context,
    List<Skill> skills,
    AnimationController controller,
  ) {
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(context);

    return AnimationLimiter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.isMobile(context) ? double.infinity : 1200,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: ResponsiveHelper.isMobile(context) ? 16 : 24,
            mainAxisSpacing: ResponsiveHelper.isMobile(context) ? 16 : 24,
            childAspectRatio: ResponsiveHelper.isMobile(context) ? 1.1 : 1.0,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 500),
              columnCount: crossAxisCount,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: SkillCard(
                    skill: skills[index],
                    animationController: controller,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Skill> _getFilteredSkills(List<Skill> skills, String category) {
    if (category == 'All') return skills;
    return skills.where((skill) => skill.category == category).toList();
  }
}