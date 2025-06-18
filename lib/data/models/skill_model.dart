import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class SkillModel with _$SkillModel {
  const factory SkillModel({
    required String id,
    required String name,
    required SkillCategory category,
    required int proficiency,
    @Default('') String iconUrl,
    @Default(0) int yearsOfExperience,
    @Default('') String description,
    @Default([]) List<String> projects,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
}

enum SkillCategory {
  language,
  frontend,
  backend,
  database,
  tool,
  design,
}

extension SkillCategoryExtension on SkillCategory {
  String get displayName {
    switch (this) {
      case SkillCategory.language:
        return 'Programming Languages';
      case SkillCategory.frontend:
        return 'Frontend Development';
      case SkillCategory.backend:
        return 'Backend Development';
      case SkillCategory.database:
        return 'Databases';
      case SkillCategory.tool:
        return 'Tools & Technologies';
      case SkillCategory.design:
        return 'Design & UI/UX';
    }
  }
}