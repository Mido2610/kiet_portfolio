import 'package:flutter/material.dart';
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


final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final localStorage = ref.watch(localStorageServiceProvider);
  return LocaleNotifier(localStorage);
});

/// Locale State Notifier
class LocaleNotifier extends StateNotifier<Locale> {
  final LocalStorage _localStorage;
  
  LocaleNotifier(this._localStorage) : super(const Locale('en')) {
    _loadSavedLocale();
  }
  
  Future<void> _loadSavedLocale() async {
    final savedLanguage = await _localStorage.getLanguage();
    state = Locale(savedLanguage);
  }
  
  Future<void> changeLocale(String languageCode) async {
    await _localStorage.saveLanguage(languageCode);
    state = Locale(languageCode);
  }
}