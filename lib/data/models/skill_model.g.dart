// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillImpl _$$SkillImplFromJson(Map<String, dynamic> json) => _$SkillImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  category: $enumDecode(_$SkillCategoryEnumMap, json['category']),
  iconUrl: json['iconUrl'] as String? ?? '',
);

Map<String, dynamic> _$$SkillImplToJson(_$SkillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$SkillCategoryEnumMap[instance.category]!,
      'iconUrl': instance.iconUrl,
    };

const _$SkillCategoryEnumMap = {
  SkillCategory.language: 'language',
  SkillCategory.framework: 'framework',
  SkillCategory.tool: 'tool',
};
