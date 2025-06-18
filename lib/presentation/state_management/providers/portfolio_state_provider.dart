import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/data/models/skill_model.dart';
import 'package:kiet_portfolio/presentation/state_management/notifiers/portfolio_state_notifier.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/experience_model.dart';

final portfolioStateProvider =
    StateNotifierProvider<PortfolioStateNotifier, PortfolioState>((ref) {
      return PortfolioStateNotifier();
    });

class PortfolioState {
  final bool isLoading;
  final List<ProjectModel> projects;
  final List<ExperienceModel> experiences;
  final List<SkillModel> skills;
  final String? error;

  const PortfolioState({
    this.isLoading = false,
    this.projects = const [],
    this.experiences = const [],
    this.skills = const [],
    this.error,
  });

  PortfolioState copyWith({
    bool? isLoading,
    List<ProjectModel>? projects,
    List<ExperienceModel>? experiences,
    List<SkillModel>? skills,
    String? error,
  }) {
    return PortfolioState(
      isLoading: isLoading ?? this.isLoading,
      projects: projects ?? this.projects,
      experiences: experiences ?? this.experiences,
      skills: skills ?? this.skills,
      error: error ?? this.error,
    );
  }
}