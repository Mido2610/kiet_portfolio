// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceImpl _$$ExperienceImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceImpl(
      id: json['id'] as String,
      company: json['company'] as String,
      position: json['position'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
      technologies:
          (json['technologies'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      logoUrl: json['logoUrl'] as String? ?? '',
      achievements:
          (json['achievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      location: json['location'] as String? ?? '',
      employmentType: json['employmentType'] as String? ?? '',
    );

Map<String, dynamic> _$$ExperienceImplToJson(_$ExperienceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'position': instance.position,
      'duration': instance.duration,
      'description': instance.description,
      'technologies': instance.technologies,
      'logoUrl': instance.logoUrl,
      'achievements': instance.achievements,
      'location': instance.location,
      'employmentType': instance.employmentType,
    };
