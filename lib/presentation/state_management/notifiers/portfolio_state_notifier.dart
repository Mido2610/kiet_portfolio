import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/experience_model.dart';
import '../../../data/models/skill_model.dart';
import '../providers/portfolio_state_provider.dart';

class PortfolioStateNotifier extends StateNotifier<PortfolioState> {
  PortfolioStateNotifier() : super(const PortfolioState()) {
    _loadInitialData();
  }

  void _loadInitialData() {
    state = state.copyWith(isLoading: true);

    // Simulate loading data
    Future.delayed(const Duration(milliseconds: 1000), () {
      state = state.copyWith(
        isLoading: false,
        projects: _getMockProjects(),
        experiences: _getMockExperiences(),
        skills: _getMockSkills(),
      );
    });
  }

  List<ProjectModel> _getMockProjects() {
    return [
      ProjectModel(
        id: '1',
        title: 'E-Commerce Mobile App',
        description:
            'A full-featured e-commerce app built with Flutter, featuring user authentication, product catalog, shopping cart, and payment integration.',
        imageUrl: 'assets/images/projects/ecommerce_app.png',
        technologies: ['Flutter', 'Firebase', 'Stripe', 'Provider'],
        githubUrl: 'https://github.com/username/ecommerce-app',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.ecommerce',
        category: ProjectCategory.mobileApp,
        isFeatured: true,
        keyFeatures: [
          'User Authentication',
          'Product Search & Filter',
          'Shopping Cart',
          'Payment Integration',
          'Order Tracking',
        ],
      ),
      ProjectModel(
        id: '2',
        title: 'Task Management Web App',
        description:
            'A collaborative task management web application with real-time updates, team collaboration features, and project tracking.',
        imageUrl: 'assets/images/projects/task_management.png',
        technologies: ['Flutter Web', 'Supabase', 'WebSocket', 'Riverpod'],
        githubUrl: 'https://github.com/username/task-management',
        liveUrl: 'https://taskmanager.example.com',
        category: ProjectCategory.webApp,
        isFeatured: true,
        keyFeatures: [
          'Real-time Collaboration',
          'Project Management',
          'Team Workspace',
          'Task Assignment',
          'Progress Tracking',
        ],
      ),
      ProjectModel(
        id: '3',
        title: 'Weather Forecast App',
        description:
            'A beautiful weather app with detailed forecasts, interactive maps, and weather alerts for multiple locations.',
        imageUrl: 'assets/images/projects/weather_app.png',
        technologies: ['Flutter', 'OpenWeather API', 'Hive', 'Geolocator'],
        githubUrl: 'https://github.com/username/weather-app',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.weather',
        category: ProjectCategory.mobileApp,
        isFeatured: true,
        keyFeatures: [
          'Current Weather',
          '7-day Forecast',
          'Interactive Maps',
          'Weather Alerts',
          'Multiple Locations',
        ],
      ),
      ProjectModel(
        id: '4',
        title: 'Fitness Tracker App',
        description:
            'A comprehensive fitness tracking app with workout planning, progress monitoring, and health insights.',
        imageUrl: 'assets/images/projects/fitness_app.png',
        technologies: ['Flutter', 'HealthKit', 'SQLite', 'Charts'],
        githubUrl: 'https://github.com/username/fitness-tracker',
        liveUrl: 'https://apps.apple.com/app/fitness-tracker/id123456789',
        category: ProjectCategory.mobileApp,
        isFeatured: true,
        keyFeatures: [
          'Workout Tracking',
          'Progress Analytics',
          'Health Integration',
          'Custom Workouts',
          'Social Features',
        ],
      ),
      ProjectModel(
        id: '5',
        title: 'Restaurant Management System',
        description:
            'A complete restaurant management system with order management, inventory tracking, and staff coordination.',
        imageUrl: 'assets/images/projects/restaurant_system.png',
        technologies: ['Flutter', 'Node.js', 'MongoDB', 'Socket.io'],
        githubUrl: 'https://github.com/username/restaurant-management',
        liveUrl: 'https://restaurant-mgmt.example.com',
        category: ProjectCategory.fullStack,
        isFeatured: true,
        keyFeatures: [
          'Order Management',
          'Inventory Tracking',
          'Staff Coordination',
          'Payment Processing',
          'Analytics Dashboard',
        ],
      ),
      ProjectModel(
        id: '6',
        title: 'Learning Management System',
        description:
            'An educational platform with course management, video streaming, assignments, and progress tracking.',
        imageUrl: 'assets/images/projects/lms.png',
        technologies: ['Flutter', 'Laravel', 'MySQL', 'Video.js'],
        githubUrl: 'https://github.com/username/lms',
        liveUrl: 'https://lms.example.com',
        category: ProjectCategory.webApp,
        isFeatured: true,
        keyFeatures: [
          'Course Management',
          'Video Streaming',
          'Assignment System',
          'Progress Tracking',
          'Discussion Forums',
        ],
      ),
    ];
  }

  List<ExperienceModel> _getMockExperiences() {
    return [
      ExperienceModel(
        id: '1',
        company: 'TechCorp Solutions',
        position: 'Senior Flutter Developer',
        duration: 'Jan 2022 - Present',
        description:
            'Lead mobile app development team, architecting scalable Flutter applications and mentoring junior developers. Collaborated with cross-functional teams to deliver high-quality mobile solutions.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'REST APIs',
          'Git',
          'Agile',
        ],
        logoUrl: 'assets/images/companies/techcorp.png',
        location: 'Ho Chi Minh City, Vietnam',
        employmentType: 'Full-time',
        achievements: [
          'Led development of 5+ mobile applications',
          'Improved app performance by 40%',
          'Mentored 3 junior developers',
          'Implemented CI/CD pipeline',
        ],
      ),
      ExperienceModel(
        id: '2',
        company: 'StartupHub Vietnam',
        position: 'Flutter Developer',
        duration: 'Jun 2020 - Dec 2021',
        description:
            'Developed and maintained multiple Flutter applications for various clients. Worked closely with UI/UX designers to implement pixel-perfect designs and ensure optimal user experience.',
        technologies: ['Flutter', 'Provider', 'SQLite', 'HTTP', 'JSON', 'Git'],
        logoUrl: 'assets/images/companies/startuphub.png',
        location: 'Ho Chi Minh City, Vietnam',
        employmentType: 'Full-time',
        achievements: [
          'Delivered 8+ client projects successfully',
          'Reduced development time by 30%',
          'Implemented responsive design patterns',
          'Integrated 10+ third-party services',
        ],
      ),
      ExperienceModel(
        id: '3',
        company: 'Freelance',
        position: 'Mobile App Developer',
        duration: 'Jan 2019 - May 2020',
        description:
            'Worked as a freelance mobile app developer, creating custom solutions for small businesses and startups. Gained experience in client communication and project management.',
        technologies: ['Flutter', 'React Native', 'Firebase', 'Node.js'],
        logoUrl: 'assets/images/companies/freelance.png',
        location: 'Remote',
        employmentType: 'Freelance',
        achievements: [
          'Completed 15+ freelance projects',
          'Maintained 95% client satisfaction rate',
          'Built cross-platform solutions',
          'Established long-term client relationships',
        ],
      ),
    ];
  }

  List<SkillModel> _getMockSkills() {
    return [
      SkillModel(
        id: '1',
        name: 'Flutter',
        category: SkillCategory.frontend,
        proficiency: 95,
        iconUrl: 'assets/images/skills/flutter.png',
        yearsOfExperience: 4,
      ),
      SkillModel(
        id: '2',
        name: 'Dart',
        category: SkillCategory.language,
        proficiency: 90,
        iconUrl: 'assets/images/skills/dart.png',
        yearsOfExperience: 4,
      ),
      SkillModel(
        id: '3',
        name: 'Firebase',
        category: SkillCategory.backend,
        proficiency: 85,
        iconUrl: 'assets/images/skills/firebase.png',
        yearsOfExperience: 3,
      ),
      SkillModel(
        id: '4',
        name: 'REST APIs',
        category: SkillCategory.backend,
        proficiency: 88,
        iconUrl: 'assets/images/skills/api.png',
        yearsOfExperience: 4,
      ),
      SkillModel(
        id: '5',
        name: 'Git',
        category: SkillCategory.tool,
        proficiency: 85,
        iconUrl: 'assets/images/skills/git.png',
        yearsOfExperience: 4,
      ),
      SkillModel(
        id: '6',
        name: 'Node.js',
        category: SkillCategory.backend,
        proficiency: 75,
        iconUrl: 'assets/images/skills/nodejs.png',
        yearsOfExperience: 2,
      ),
    ];
  }

  void refreshData() {
    _loadInitialData();
  }

  void setError(String error) {
    state = state.copyWith(error: error, isLoading: false);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}