import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/experience_model.dart';
import '../state_management/notifiers/work_experience_notifer.dart';
import '../state_management/state/work_experience_state.dart';
import 'skills_provider.dart'; // Import để dùng portfolioRepositoryProvider

// Work Experience Provider
final workExperienceProvider =
    StateNotifierProvider<WorkExperienceNotifier, WorkExperienceState>(
      (ref) => WorkExperienceNotifier(ref.watch(portfolioRepositoryProvider)),
    );

// Experiences sorted by date (newest first)
final sortedExperiencesProvider = Provider<List<Experience>>((ref) {
  final experiences = ref.watch(workExperienceProvider).experiences;
  final sortedExperiences = List<Experience>.from(experiences);

  // Sort by duration - assuming format like "2023 - Present" or "2022 - 2023"
  sortedExperiences.sort((a, b) {
    // Handle "Present" as current date
    final aEndYear =
        a.duration.toLowerCase().contains('present')
            ? DateTime.now().year
            : _extractEndYear(a.duration);
    final bEndYear =
        b.duration.toLowerCase().contains('present')
            ? DateTime.now().year
            : _extractEndYear(b.duration);

    return bEndYear.compareTo(aEndYear); // Newest first
  });

  return sortedExperiences;
});

// Current experience (latest one with "Present")
final currentExperienceProvider = Provider<Experience?>((ref) {
  final experiences = ref.watch(workExperienceProvider).experiences;
  if (experiences.isEmpty) return null;

  try {
    return experiences.firstWhere(
      (exp) => exp.duration.toLowerCase().contains('present'),
    );
  } catch (e) {
    return experiences.first; // Fallback to first experience
  }
});


// Experience statistics
final experienceStatsProvider = Provider<ExperienceStats>((ref) {
  final experiences = ref.watch(workExperienceProvider).experiences;

  final allTechnologies = <String>{};
  var totalAchievements = 0;
  final companiesList = <String>{};

  for (final experience in experiences) {
    allTechnologies.addAll(experience.technologies);
    totalAchievements += experience.achievements.length;
    companiesList.add(experience.company);
  }

  // Calculate total years of experience
  final totalYears = _calculateTotalYearsOfExperience(experiences);

  return ExperienceStats(
    totalExperiences: experiences.length,
    totalYears: totalYears,
    totalCompanies: companiesList.length,
    totalTechnologies: allTechnologies.length,
    totalAchievements: totalAchievements,
  );
});

// Get experience by ID
final experienceByIdProvider = Provider.family<Experience?, String>((ref, id) {
  final experiences = ref.watch(workExperienceProvider).experiences;
  try {
    return experiences.firstWhere((exp) => exp.id == id);
  } catch (e) {
    return null;
  }
});

// Helper function to extract end year from duration string
int _extractEndYear(String duration) {
  final regex = RegExp(r'(\d{4})');
  final matches = regex.allMatches(duration).toList();

  if (matches.isNotEmpty) {
    // Get the last year mentioned (end year)
    return int.tryParse(matches.last.group(1) ?? '0') ?? 0;
  }

  return 0; // Default
}

// Helper function to calculate total years of experience
double _calculateTotalYearsOfExperience(List<Experience> experiences) {
  double totalYears = 0;

  for (final experience in experiences) {
    final regex = RegExp(r'(\d{4})');
    final matches = regex.allMatches(experience.duration).toList();

    if (matches.isNotEmpty) {
      final startYear = int.tryParse(matches.first.group(1) ?? '0') ?? 0;
      final endYear =
          experience.duration.toLowerCase().contains('present')
              ? DateTime.now().year
              : (matches.length > 1
                  ? int.tryParse(matches.last.group(1) ?? '0') ??
                      DateTime.now().year
                  : DateTime.now().year);

      totalYears += (endYear - startYear).toDouble();
    }
  }

  return totalYears;
}

// Experience stats model
class ExperienceStats {
  final int totalExperiences;
  final double totalYears;
  final int totalCompanies;
  final int totalTechnologies;
  final int totalAchievements;

  const ExperienceStats({
    required this.totalExperiences,
    required this.totalYears,
    required this.totalCompanies,
    required this.totalTechnologies,
    required this.totalAchievements,
  });
}

final experienceVisibilityProvider = StateNotifierProvider<_ExperienceVisibilityNotifier, Set<int>>(
  (ref) => _ExperienceVisibilityNotifier(),
);

class _ExperienceVisibilityNotifier extends StateNotifier<Set<int>> {
  _ExperienceVisibilityNotifier() : super({});
  
  void markVisible(int index) {
    if (!state.contains(index)) {
      state = {...state, index};
    }
  }
}