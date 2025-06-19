import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/services/local_storage.dart';

// =============================================================================
// CORE SERVICE PROVIDERS
// =============================================================================

/// Local Storage Service Provider
final localStorageServiceProvider = Provider<LocalStorage>((ref) {
  return SharedPreferencesService.instance;
});

/// Local Storage Initialization Provider
/// Must be called before using localStorageServiceProvider
final localStorageInitProvider = FutureProvider<void>((ref) async {
  await SharedPreferencesService.instance.init();
});

// =============================================================================
// INITIALIZATION PROVIDERS
// =============================================================================

/// App Initialization Provider
/// Handles all app initialization logic
final appInitializationProvider = FutureProvider<void>((ref) async {
  // Initialize local storage first
  await ref.watch(localStorageInitProvider.future);

  // Add other initialization logic here if needed
  // await ref.watch(analyticsInitProvider.future);
  // await ref.watch(crashlyticsInitProvider.future);
});

final platformProvider = Provider<String>((ref) {
  return 'web';
});