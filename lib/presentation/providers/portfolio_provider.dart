import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/portfolio_state.dart';
import '../../core/constants/app_constants.dart';

class PortfolioNotifier extends StateNotifier<PortfolioState> {
  PortfolioNotifier() : super(const PortfolioState()) {
    _loadInitialData();
  }

  void _loadInitialData() {
    state = state.copyWith(isLoading: true);

    Future.delayed(const Duration(milliseconds: 800), () {
      state = state.copyWith(
        isLoading: false,
        projects: _mockProjects,
        skills: _mockSkills,
        experiences: _mockExperiences,
      );
    });
  }

  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }

  void updateCurrentSection(int section) {
    if (state.currentSection != section) {
      state = state.copyWith(currentSection: section);
    }
  }

  void toggleTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void toggleMenu() {
    state = state.copyWith(isMenuOpen: !state.isMenuOpen);
  }

  void setSelectedFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  void closeMenu() {
    state = state.copyWith(isMenuOpen: false);
  }

  List<Project> get filteredProjects {
    if (state.selectedFilter.isEmpty || state.selectedFilter == 'All') {
      return state.projects;
    }
    return state.projects
        .where((project) => project.category == state.selectedFilter)
        .toList();
  }

  List<Project> get featuredProjects {
    return state.projects.where((project) => project.isFeatured).toList();
  }

  List<Project> get _mockProjects => [
    const Project(
      id: '1',
      title: 'E-commerce Mobile App',
      description:
          'A modern e-commerce mobile application built with Flutter and Firebase. Features include user authentication, product catalog, shopping cart, payment integration, and order tracking.',
      imageUrl: 'assets/images/ecommerce_app.png',
      technologies: ['Flutter', 'Firebase', 'Stripe', 'Provider', 'REST API'],
      githubUrl: 'https://github.com/kietnguyen/ecommerce-app',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.kiet.ecommerce',
      category: 'Mobile App',
      isFeatured: true,
      videoUrl: 'assets/videos/ecommerce_demo.mp4',
    ),
    const Project(
      id: '2',
      title: 'Task Management Web App',
      description:
          'A collaborative task management web application with real-time synchronization, team collaboration features, and advanced project tracking capabilities.',
      imageUrl: 'assets/images/task_management.png',
      technologies: ['Flutter Web', 'Firebase', 'WebSocket', 'Riverpod'],
      githubUrl: 'https://github.com/kietnguyen/task-management',
      liveUrl: 'https://taskmanager.kietnguyen.dev',
      category: 'Web App',
      isFeatured: true,
    ),
    const Project(
      id: '3',
      title: 'Weather Forecast App',
      description:
          'A beautiful weather forecast application with location-based weather data, 7-day forecasts, and interactive weather maps.',
      imageUrl: 'assets/images/weather_app.png',
      technologies: ['Flutter', 'OpenWeather API', 'Geolocator', 'Hooks'],
      githubUrl: 'https://github.com/kietnguyen/weather-app',
      liveUrl: 'https://weather.kietnguyen.dev',
      category: 'Mobile App',
      isFeatured: false,
    ),
    const Project(
      id: '4',
      title: 'Portfolio Website',
      description:
          'A responsive portfolio website built with Flutter Web, featuring modern animations, dark mode, and optimized performance.',
      imageUrl: 'assets/images/portfolio_web.png',
      technologies: ['Flutter Web', 'Hooks Riverpod', 'Responsive Design'],
      githubUrl: 'https://github.com/kietnguyen/portfolio',
      liveUrl: 'https://kietnguyen.dev',
      category: 'Web App',
      isFeatured: true,
    ),
  ];

  List<Skill> get _mockSkills => [
    const Skill(
      name: 'Flutter',
      level: 0.95,
      iconPath: 'assets/icons/flutter.svg',
      category: 'Frontend',
      description: 'Cross-platform mobile and web development',
    ),
    const Skill(
      name: 'Dart',
      level: 0.90,
      iconPath: 'assets/icons/dart.svg',
      category: 'Language',
      description: 'Primary programming language for Flutter',
    ),
    const Skill(
      name: 'Firebase',
      level: 0.85,
      iconPath: 'assets/icons/firebase.svg',
      category: 'Backend',
      description: 'Backend-as-a-Service platform',
    ),
    const Skill(
      name: 'UI/UX Design',
      level: 0.80,
      iconPath: 'assets/icons/design.svg',
      category: 'Design',
      description: 'User interface and experience design',
    ),
    const Skill(
      name: 'REST API',
      level: 0.85,
      iconPath: 'assets/icons/api.svg',
      category: 'Backend',
      description: 'RESTful API integration and development',
    ),
    const Skill(
      name: 'Git',
      level: 0.88,
      iconPath: 'assets/icons/git.svg',
      category: 'Tools',
      description: 'Version control and collaboration',
    ),
    const Skill(
      name: 'Riverpod',
      level: 0.82,
      iconPath: 'assets/icons/riverpod.svg',
      category: 'State Management',
      description: 'Modern state management for Flutter',
    ),
    const Skill(
      name: 'SQLite',
      level: 0.75,
      iconPath: 'assets/icons/sqlite.svg',
      category: 'Database',
      description: 'Local database management',
    ),
  ];

  List<Experience> get _mockExperiences => [
    const Experience(
      id: '1',
      company: 'Tech Solutions Inc.',
      position: 'Senior Flutter Developer',
      duration: '2023 - Present',
      description:
          'Leading mobile app development projects, mentoring junior developers, and implementing best practices for Flutter development.',
      technologies: ['Flutter', 'Firebase', 'CI/CD', 'Code Review'],
      logoUrl: 'assets/images/company1.png',
    ),
    const Experience(
      id: '2',
      company: 'Digital Agency Co.',
      position: 'Flutter Developer',
      duration: '2021 - 2023',
      description:
          'Developed multiple mobile applications for clients, implemented complex UI/UX designs, and integrated various third-party services.',
      technologies: ['Flutter', 'REST API', 'State Management', 'Testing'],
      logoUrl: 'assets/images/company2.png',
    ),
    const Experience(
      id: '3',
      company: 'Startup Hub',
      position: 'Mobile App Developer',
      duration: '2020 - 2021',
      description:
          'Built MVP mobile applications for startups, worked in agile environment, and collaborated with cross-functional teams.',
      technologies: ['Flutter', 'Firebase', 'MVP Development', 'Agile'],
      logoUrl: 'assets/images/company3.png',
    ),
  ];
}

final portfolioProvider =
    StateNotifierProvider<PortfolioNotifier, PortfolioState>(
      (ref) => PortfolioNotifier(),
    );

// Scroll Controller Provider
final scrollControllerProvider = Provider<ScrollController>((ref) {
  final controller = ScrollController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

// Section Visibility Provider
final sectionVisibilityProvider = StateProvider.family<bool, int>(
  (ref, sectionIndex) => false,
);

// Animation Controller Providers
final heroAnimationProvider = Provider.autoDispose<AnimationController>((ref) {
  final controller = AnimationController(
    duration: AppConstants.slowDuration,
    vsync: ref.watch(tickerProvider),
  );
  ref.onDispose(() => controller.dispose());
  return controller;
});

final tickerProvider = Provider<TickerProvider>((ref) {
  throw UnimplementedError('TickerProvider must be overridden');
});