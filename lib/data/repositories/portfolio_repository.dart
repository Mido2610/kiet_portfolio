
import 'package:kiet_portfolio/core/enums/skill_enum.dart';

import '../models/skill_model.dart';
import '../models/project_model.dart';
import '../models/experience_model.dart';

class PortfolioRepository {
  // Mock data - trong thực tế có thể lấy từ API
  Future<List<Skill>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      const Skill(
        id: '1',
        name: 'Flutter',
        category: SkillCategory.framework,
        iconUrl: 'assets/icons/flutter.svg',
      ),
      const Skill(
        id: '2',
        name: 'Dart',
        category: SkillCategory.language,
        iconUrl: 'assets/icons/dart.svg',
      ),
      const Skill(
        id: '4',
        name: 'Git',
        category: SkillCategory.tool,
        iconUrl: 'assets/icons/git.svg',
      ),
      const Skill(
        id: '5',
        name: 'JavaScript',
        category: SkillCategory.language,
        iconUrl: 'assets/icons/javascript.svg',
      ),
      const Skill(
        id: '7',
        name: 'Figma',
        category: SkillCategory.tool,
        iconUrl : 'assets/icons/figma.svg',
      ),
    ];
  }

  Future<List<Project>> getProjects() async {
    await Future.delayed(const Duration(milliseconds: 600));
    // Return your mock projects here
    return [];
  }

  Future<List<Experience>> getExperiences() async {
    await Future.delayed(const Duration(milliseconds: 400));
    // Return your mock experiences here
    return [];
  }
}