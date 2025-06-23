import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../state/work_experience_state.dart';

class WorkExperienceNotifier extends StateNotifier<WorkExperienceState> {
  final PortfolioRepository _repository;

  WorkExperienceNotifier(this._repository) : super(const WorkExperienceState()) {
    loadExperiences();
  }

  FutureOr<void> loadExperiences() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final experiences = await _repository.getWorkExperiences();
      state = state.copyWith(
        isLoading: false,
        experiences: experiences,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  FutureOr<void> refreshExperiences() async {
    await loadExperiences();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}