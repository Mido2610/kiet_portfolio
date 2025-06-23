import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/experience_model.dart';

part 'work_experience_state.freezed.dart';
part 'work_experience_state.g.dart';

@freezed
class WorkExperienceState with _$WorkExperienceState {
  const factory WorkExperienceState({
    @Default([]) List<Experience> experiences,
    @Default(false) bool isLoading,
    @Default('') String selectedCompany,
    String? error,
  }) = _WorkExperienceState;

  factory WorkExperienceState.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceStateFromJson(json);
}