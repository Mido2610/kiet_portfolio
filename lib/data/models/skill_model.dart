import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kiet_portfolio/core/enums/skill_enum.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String id,
    required String name,
    required SkillCategory category,
    @Default('') String iconUrl,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) =>
      _$SkillFromJson(json);
}