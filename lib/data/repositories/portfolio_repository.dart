import 'package:kiet_portfolio/core/enums/skill_enum.dart';

import '../models/skill_model.dart';
import '../models/experience_model.dart';

class PortfolioRepository {
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
        id: '3',
        name: 'Git',
        category: SkillCategory.tool,
        iconUrl: 'assets/icons/git.svg',
      ),
      const Skill(
        id: '4',
        name: 'JavaScript',
        category: SkillCategory.language,
        iconUrl: 'assets/icons/javascript.svg',
      ),
      const Skill(
        id: '5',
        name: 'Figma',
        category: SkillCategory.tool,
        iconUrl: 'assets/icons/figma.svg',
      ),
      const Skill(
        id: '6',
        name: 'ReactJS',
        category: SkillCategory.framework,
        iconUrl: 'assets/icons/reactjs.svg',
      ),
      const Skill(
        id: '7',
        name: 'TypeScript',
        category: SkillCategory.language,
        iconUrl: 'assets/icons/typescript.svg',
      ),
      const Skill(
        id: '7',
        name: 'VSCode',
        category: SkillCategory.tool,
        iconUrl: 'assets/icons/vscode.svg',
      ),
      const Skill(
        id: '8',
        name: 'GitHub',
        category: SkillCategory.tool,
        iconUrl: 'assets/icons/github.svg',
      ),
      const Skill(
        id: '9',
        name: 'GitLab',
        category: SkillCategory.tool,
        iconUrl: 'assets/icons/gitlab.svg',
      ),
    ];
  }

  Future<List<Experience>> getExperiences() async {
    await Future.delayed(const Duration(milliseconds: 400));
    // Return your mock experiences here
    return [];
  }

  // Thêm method này vào PortfolioRepository class
  Future<List<Experience>> getWorkExperiences() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      const Experience(
        id: '1',
        company: 'Mmenu',
        position: 'Frontend Developer',
        duration: '2024 - Present',
        description:
            'Leading mobile app development team, focusing on cross-platform solutions using Flutter. Responsible for architecture decisions, code reviews, and mentoring junior developers.',
        technologies: [
          'Flutter',
          'Firebase',
          'ReactJS',
          'Git',
          'GitLab',
          'TypeScript',
          'Dart',
          'Figma',
          'VSCode',
          'JavaScript',
          'GitHub',
        ],
        logoUrl: 'assets/images/mmenu.png',
        achievements: [
          'Led development of mobile banking app serving 500K+ users',
          'Reduced app crash rate from 2.1% to 0.3% through optimization',
          'Implemented CI/CD pipeline reducing deployment time by 70%',
          'Mentored 3 junior developers improving team productivity by 25%',
          'Designed and implemented offline-first architecture',
        ],
        location: 'Ho Chi Minh City, Vietnam',
        employmentType: 'Full-time',
      ),
    ];
  }
}