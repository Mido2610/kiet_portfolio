// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      technologies:
          (json['technologies'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      githubUrl: json['githubUrl'] as String,
      liveUrl: json['liveUrl'] as String,
      category: $enumDecode(_$ProjectCategoryEnumMap, json['category']),
      isFeatured: json['isFeatured'] as bool? ?? false,
      videoUrl: json['videoUrl'] as String? ?? '',
      screenshots:
          (json['screenshots'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      clientName: json['clientName'] as String? ?? '',
      projectDuration: json['projectDuration'] as String? ?? '',
      keyFeatures:
          (json['keyFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      longDescription: json['longDescription'] as String? ?? '',
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'technologies': instance.technologies,
      'githubUrl': instance.githubUrl,
      'liveUrl': instance.liveUrl,
      'category': _$ProjectCategoryEnumMap[instance.category]!,
      'isFeatured': instance.isFeatured,
      'videoUrl': instance.videoUrl,
      'screenshots': instance.screenshots,
      'clientName': instance.clientName,
      'projectDuration': instance.projectDuration,
      'keyFeatures': instance.keyFeatures,
      'longDescription': instance.longDescription,
    };

const _$ProjectCategoryEnumMap = {
  ProjectCategory.mobileApp: 'mobileApp',
  ProjectCategory.webApp: 'webApp',
  ProjectCategory.uiUx: 'uiUx',
  ProjectCategory.backend: 'backend',
  ProjectCategory.fullStack: 'fullStack',
};
