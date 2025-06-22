import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/services/local_storage.dart';
import 'package:kiet_portfolio/l10n/localization.dart';

// =============================================================================
// CORE SERVICE PROVIDERS
// =============================================================================

/// Localization Service Provider
final localizationProvider = Provider<Localization>((ref) {
  return Localization.instance;
});

/// Local Storage Service Provider
final localStorageServiceProvider = Provider<LocalStorage>((ref) {
  ref.watch(localStorageInitProvider);
  return SharedPreferencesService.instance;
});

/// Local Storage Initialization Provider
final localStorageInitProvider = FutureProvider<void>((ref) async {
  await SharedPreferencesService.instance.init();
});

// =============================================================================
// LANGUAGE/LOCALE PROVIDERS (CONSOLIDATED)
// =============================================================================

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier(ref);
});

// Language provider cho UI consumption
final languageProvider = Provider<String>((ref) {
  return ref.watch(localeProvider).languageCode;
});

// Language notifier để change language từ UI
final languageNotifierProvider = Provider<LanguageNotifier>((ref) {
  return LanguageNotifier(ref);
});

class LocaleNotifier extends StateNotifier<Locale> {
  final Ref _ref;
  bool _isInitialized = false;

  LocaleNotifier(this._ref) : super(const Locale('en'));

  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await _ref.read(localStorageInitProvider.future);
      final localStorage = _ref.read(localStorageServiceProvider);
      final savedLanguage = await localStorage.getLanguage();


      if (mounted) {
        state = Locale(savedLanguage);
        _isInitialized = true;
      }
    } catch (error) {
      debugPrint('Failed to load saved locale: $error');
      if (mounted) {
        state = const Locale('en');
        _isInitialized = true;
      }
    }
  }

  Future<void> changeLocale(String languageCode) async {
    try {
      
      if (!_isInitialized) await initialize();

      final localStorage = _ref.read(localStorageServiceProvider);
      await localStorage.saveLanguage(languageCode);

      if (mounted) {
        state = Locale(languageCode);
      }
    } catch (error) {
      debugPrint('Failed to change locale: $error');
    }
  }
}

class LanguageNotifier {
  final Ref _ref;

  LanguageNotifier(this._ref);

  Future<void> setLanguage(String languageCode) async {
    await _ref.read(localeProvider.notifier).changeLocale(languageCode);
  }

  String getCurrentLanguage() {
    return _ref.read(languageProvider);
  }
}

// =============================================================================
// APP INITIALIZATION
// =============================================================================

/// App Initialization Provider
final appInitializationProvider = FutureProvider<void>((ref) async {
  try {
    // Initialize storage 
    await ref.watch(localStorageInitProvider.future);

    // Initialize locale
    await ref.read(localeProvider.notifier).initialize();

  } catch (error) {
    debugPrint('App initialization failed: $error');
    rethrow;
  }
});