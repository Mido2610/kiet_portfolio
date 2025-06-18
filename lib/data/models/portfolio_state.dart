import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_state.freezed.dart';
part 'portfolio_state.g.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    @Default(0) int currentSection,
    @Default(false) bool isLoading,
    @Default([]) List<Project> projects,
    @Default([]) List<Skill> skills,
    @Default([]) List<Experience> experiences,
    @Default(0.0) double scrollOffset,
    @Default(false) bool isDarkMode,
    @Default('') String selectedFilter,
    @Default(false) bool isMenuOpen,
  }) = _PortfolioState;

  factory PortfolioState.fromJson(Map<String, dynamic> json) =>
      _$PortfolioStateFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required List<String> technologies,
    required String githubUrl,
    required String liveUrl,
    required String category,
    @Default(false) bool isFeatured,
    @Default('') String videoUrl,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String name,
    required double level,
    required String iconPath,
    required String category,
    @Default('') String description,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) =>
      _$SkillFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String id,
    required String company,
    required String position,
    required String duration,
    required String description,
    required List<String> technologies,
    @Default('') String logoUrl,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    required String email,
    required String phone,
    required String linkedin,
    required String github,
    @Default('') String twitter,
    @Default('') String location,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
}