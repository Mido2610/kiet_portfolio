import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/data/repositories/portfolio_repository.dart';
import 'package:kiet_portfolio/presentation/state_management/state/skills_state.dart';

class SkillsNotifier extends StateNotifier<SkillsState> {
  final PortfolioRepository _repository;

  SkillsNotifier(this._repository) : super(const SkillsState()) {
    loadingSkills();
  }

  FutureOr<void> loadingSkills() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final skills = await _repository.getSkills();
      state = state.copyWith(isLoading: false, skills: skills);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  FutureOr<void> refreshSkills() async {
    await loadingSkills();
  }
}