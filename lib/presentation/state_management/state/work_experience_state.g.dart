// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkExperienceStateImpl _$$WorkExperienceStateImplFromJson(
  Map<String, dynamic> json,
) => _$WorkExperienceStateImpl(
  experiences:
      (json['experiences'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isLoading: json['isLoading'] as bool? ?? false,
  selectedCompany: json['selectedCompany'] as String? ?? '',
  error: json['error'] as String?,
);

Map<String, dynamic> _$$WorkExperienceStateImplToJson(
  _$WorkExperienceStateImpl instance,
) => <String, dynamic>{
  'experiences': instance.experiences,
  'isLoading': instance.isLoading,
  'selectedCompany': instance.selectedCompany,
  'error': instance.error,
};
