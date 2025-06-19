import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kiet_portfolio/data/models/skill_model.dart';

part 'skills_state.freezed.dart';

@freezed
class SkillsState with _$SkillsState {
  const factory SkillsState({
    @Default(false) bool isLoading,
    @Default([]) List<Skill> skills,
    @Default('All') String selectedCategory,
    String? error,
  }) = _SkillsState;
}