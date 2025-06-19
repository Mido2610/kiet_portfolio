enum SkillCategory { language, framework, tool }

extension SkillCategoryExtension on SkillCategory {
  String get displayName {
    switch (this) {
      case SkillCategory.language:
        return 'Programming Languages';
      case SkillCategory.framework:
        return 'Frameworks';
      case SkillCategory.tool:
        return 'Tools & Technologies';
    }
  }
}