import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_model.freezed.dart';
part 'experience_model.g.dart';

@freezed
class ExperienceModel with _$ExperienceModel {
  const factory ExperienceModel({
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
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);
}