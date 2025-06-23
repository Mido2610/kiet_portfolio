import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kiet_portfolio/core/utils/size.dart';
import 'package:kiet_portfolio/data/models/skill_model.dart';
import 'package:kiet_portfolio/presentation/cards/skill_cards.dart';
import 'package:kiet_portfolio/presentation/providers/skills_provider.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';
import '../animations/fade_in_up.dart';
import '../../../core/utils/common.dart';

class SkillsSection extends HookConsumerWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsState = ref.watch(skillsProvider);
    final filteredSkills = ref.watch(filteredSkillsProvider);
    final skillCategories = ref.watch(skillCategoriesProvider);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 2000),
    );

    final isVisible = useState(false);

    useEffect(() {
      // Load skills when component mounts
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(skillsProvider.notifier).loadSkills();
      });

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
            child: const _SkillsSectionHeaderWidget(),
          ),
          SizedBoxCommon.height40,
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: _SkillsCategoryFilterWidget(
              selectedCategory: skillsState.selectedCategory,
              categories: skillCategories,
              onCategorySelected: (category) {
                ref.read(skillsProvider.notifier).setSelectedCategory(category);
              },
            ),
          ),
          SizedBoxCommon.height60,
          if (skillsState.isLoading)
            const CircularProgressIndicator(color: AppColors.accent)
          else if (skillsState.error != null)
            Text(
              'Error: ${skillsState.error}',
              style: const TextStyle(color: Colors.red),
            )
          else
            _SkillGridCardWidget(
              animationController: animationController,
              skills: filteredSkills,
            ),
        ],
      ),
    );
  }
}

class _SkillsCategoryFilterWidget extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const _SkillsCategoryFilterWidget({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            categories.map((category) {
              final isSelected = selectedCategory == category;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _SkillsCategoryChipWidget(
                  category: category,
                  isSelected: isSelected,
                  onTap: () => onCategorySelected(category),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _SkillsCategoryChipWidget extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const _SkillsCategoryChipWidget({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                              color: AppColors.accent.withAlpha(
                                (0.3 * 255).round(),
                              ),
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
                        isSelected ? AppColors.surface : AppColors.textPrimary,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                      context,
                      mobile: 14,
                      tablet: 16,
                      desktop: 16,
                    ),
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
}

class _SkillGridCardWidget extends StatelessWidget {
  final List<Skill> skills;
  final AnimationController animationController;

  const _SkillGridCardWidget({
    required this.skills,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(context);

    return AnimationLimiter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.isMobile(context) ? double.infinity : 1000,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: ResponsiveHelper.isMobile(context) ? 12 : 24,
            mainAxisSpacing: ResponsiveHelper.isMobile(context) ? 12 : 24,
            childAspectRatio: ResponsiveHelper.isMobile(context) ? 0.85 : 1.0,
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
                    animationController: animationController,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SkillsSectionHeaderWidget extends StatelessWidget {
  const _SkillsSectionHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          l10n(context).technologiesTitle,
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
        SizedBoxCommon.height16,
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
        SizedBoxCommon.height20,
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            l10n(context).skillsDescription,
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
}