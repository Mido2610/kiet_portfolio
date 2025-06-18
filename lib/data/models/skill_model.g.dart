// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillModelImpl _$$SkillModelImplFromJson(Map<String, dynamic> json) =>
    _$SkillModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$SkillCategoryEnumMap, json['category']),
      proficiency: (json['proficiency'] as num).toInt(),
      iconUrl: json['iconUrl'] as String? ?? '',
      yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      projects:
          (json['projects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SkillModelImplToJson(_$SkillModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$SkillCategoryEnumMap[instance.category]!,
      'proficiency': instance.proficiency,
      'iconUrl': instance.iconUrl,
      'yearsOfExperience': instance.yearsOfExperience,
      'description': instance.description,
      'projects': instance.projects,
    };

const _$SkillCategoryEnumMap = {
  SkillCategory.language: 'language',
  SkillCategory.frontend: 'frontend',
  SkillCategory.backend: 'backend',
  SkillCategory.database: 'database',
  SkillCategory.tool: 'tool',
  SkillCategory.design: 'design',
};
