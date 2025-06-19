import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

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
    required ProjectCategory category,
    @Default(false) bool isFeatured,
    @Default('') String videoUrl,
    @Default([]) List<String> screenshots,
    @Default('') String clientName,
    @Default('') String projectDuration,
    @Default([]) List<String> keyFeatures,
    @Default('') String longDescription,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

enum ProjectCategory {
  mobileApp,
  webApp,
  uiUx,
  backend,
  fullStack,
}

extension ProjectCategoryExtension on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.mobileApp:
        return 'Mobile App';
      case ProjectCategory.webApp:
        return 'Web App';
      case ProjectCategory.uiUx:
        return 'UI/UX Design';
      case ProjectCategory.backend:
        return 'Backend';
      case ProjectCategory.fullStack:
        return 'Full Stack';
    }
  }
}

enum ProjectFilter {
  all,
  mobileApps,
  webApps,
  uiUx,
  backend,
  fullStack,
}

extension ProjectFilterExtension on ProjectFilter {
  String get displayName {
    switch (this) {
      case ProjectFilter.all:
        return 'All Projects';
      case ProjectFilter.mobileApps:
        return 'Mobile Apps';
      case ProjectFilter.webApps:
        return 'Web Apps';
      case ProjectFilter.uiUx:
        return 'UI/UX Design';
      case ProjectFilter.backend:
        return 'Backend';
      case ProjectFilter.fullStack:
        return 'Full Stack';
    }
  }
}