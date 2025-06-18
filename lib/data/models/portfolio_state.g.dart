// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioStateImpl _$$PortfolioStateImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioStateImpl(
      currentSection: (json['currentSection'] as num?)?.toInt() ?? 0,
      isLoading: json['isLoading'] as bool? ?? false,
      projects:
          (json['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      experiences:
          (json['experiences'] as List<dynamic>?)
              ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      scrollOffset: (json['scrollOffset'] as num?)?.toDouble() ?? 0.0,
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      selectedFilter: json['selectedFilter'] as String? ?? '',
      isMenuOpen: json['isMenuOpen'] as bool? ?? false,
    );

Map<String, dynamic> _$$PortfolioStateImplToJson(
  _$PortfolioStateImpl instance,
) => <String, dynamic>{
  'currentSection': instance.currentSection,
  'isLoading': instance.isLoading,
  'projects': instance.projects,
  'skills': instance.skills,
  'experiences': instance.experiences,
  'scrollOffset': instance.scrollOffset,
  'isDarkMode': instance.isDarkMode,
  'selectedFilter': instance.selectedFilter,
  'isMenuOpen': instance.isMenuOpen,
};

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
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
      category: json['category'] as String,
      isFeatured: json['isFeatured'] as bool? ?? false,
      videoUrl: json['videoUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'technologies': instance.technologies,
      'githubUrl': instance.githubUrl,
      'liveUrl': instance.liveUrl,
      'category': instance.category,
      'isFeatured': instance.isFeatured,
      'videoUrl': instance.videoUrl,
    };

_$SkillImpl _$$SkillImplFromJson(Map<String, dynamic> json) => _$SkillImpl(
  name: json['name'] as String,
  level: (json['level'] as num).toDouble(),
  iconPath: json['iconPath'] as String,
  category: json['category'] as String,
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$$SkillImplToJson(_$SkillImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'iconPath': instance.iconPath,
      'category': instance.category,
      'description': instance.description,
    };

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
    };

_$ContactInfoImpl _$$ContactInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContactInfoImpl(
      email: json['email'] as String,
      phone: json['phone'] as String,
      linkedin: json['linkedin'] as String,
      github: json['github'] as String,
      twitter: json['twitter'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$$ContactInfoImplToJson(_$ContactInfoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'linkedin': instance.linkedin,
      'github': instance.github,
      'twitter': instance.twitter,
      'location': instance.location,
    };
