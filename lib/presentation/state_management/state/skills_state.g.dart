// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillsStateImpl _$$SkillsStateImplFromJson(Map<String, dynamic> json) =>
    _$SkillsStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedCategory: json['selectedCategory'] as String? ?? 'All',
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$SkillsStateImplToJson(_$SkillsStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'skills': instance.skills,
      'selectedCategory': instance.selectedCategory,
      'error': instance.error,
    };
