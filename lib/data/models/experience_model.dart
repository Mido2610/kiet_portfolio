import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_model.freezed.dart';
part 'experience_model.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String id,
    required String company,
    required String position,
    required String duration,
    required String description,
    required List<String> technologies,
    @Default('') String logoUrl,
    @Default([]) List<String> achievements,
    @Default('') String location,
    @Default('') String employmentType,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}