import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/enums/skill_enum.dart';
import 'package:kiet_portfolio/presentation/state_management/notifiers/skills_notifier.dart';
import 'package:kiet_portfolio/presentation/state_management/state/skills_state.dart';
import '../../data/models/skill_model.dart';
import '../../data/repositories/portfolio_repository.dart';

// Repository provider
final portfolioRepositoryProvider = Provider<PortfolioRepository>(
  (ref) => PortfolioRepository(),
);

// Main skills provider
final skillsProvider = StateNotifierProvider<SkillsNotifier, SkillsState>(
  (ref) => SkillsNotifier(ref.watch(portfolioRepositoryProvider)),
);

// Filtered skills provider
final filteredSkillsProvider = Provider<List<Skill>>((ref) {
  final skillsState = ref.watch(skillsProvider);
  final selectedCategory = skillsState.selectedCategory;

  if (selectedCategory == 'All') {
    return skillsState.skills;
  }

  return skillsState.skills.where((skill) {
    switch (selectedCategory) {
      case 'Languages':
        return skill.category == SkillCategory.language;
      case 'Frameworks':
        return skill.category == SkillCategory.framework;
      case 'Tools':
        return skill.category == SkillCategory.tool;
      default:
        return true;
    }
  }).toList();
});

// Danh mục kỹ năng
final skillCategoriesProvider = Provider<List<String>>((ref) {
  return ['All', 'Languages', 'Frameworks', 'Tools'];
});