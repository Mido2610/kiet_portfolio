import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/services/local_storage.dart';
import 'package:kiet_portfolio/presentation/state_management/state/portfolio_state.dart';

class PortfolioNotifier extends StateNotifier<PortfolioState> {
  final LocalStorage? _localStorage;

  PortfolioNotifier({LocalStorage? localStorage})
    : _localStorage = localStorage,
      super(const PortfolioState()) {
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await _loadUserPreferences();
    _detectDeviceType();

    state = state.copyWith(isInitialized: true, lastUpdated: DateTime.now());
  }

  // Navigation & Scroll Management
  void updateScrollOffset(double offset) {
    state = state.copyWith(scrollOffset: offset);
  }

  void updateCurrentSection(int section) {
    if (state.currentSection != section) {
      state = state.copyWith(currentSection: section);
    }
  }

  void setAutoScrolling(bool isScrolling) {
    state = state.copyWith(isAutoScrolling: isScrolling);
  }

  // Menu Management
  void toggleMenu() {
    state = state.copyWith(isMenuOpen: !state.isMenuOpen);
  }

  void closeMenu() {
    state = state.copyWith(isMenuOpen: false);
  }

  // Device Type Management
  void updateDeviceType({
    required bool isMobile,
    required bool isTablet,
    required bool isDesktop,
  }) {
    state = state.copyWith(
      isMobileView: isMobile,
      isTabletView: isTablet,
      isDesktopView: isDesktop,
    );
  }

  // Animation & Effects Settings
  void toggleAnimations() {
    final newValue = !state.enableAnimations;
    state = state.copyWith(enableAnimations: newValue);
    _savePreference('enableAnimations', newValue);
  }

  void toggleParallax() {
    final newValue = !state.enableParallax;
    state = state.copyWith(enableParallax: newValue);
    _savePreference('enableParallax', newValue);
  }

  void toggleSoundEffects() {
    final newValue = !state.enableSoundEffects;
    state = state.copyWith(enableSoundEffects: newValue);
    _savePreference('enableSoundEffects', newValue);
  }

  // Accessibility Settings
  void toggleReducedMotion() {
    final newValue = !state.enableReducedMotion;
    state = state.copyWith(enableReducedMotion: newValue);
    _savePreference('enableReducedMotion', newValue);
  }

  void toggleHighContrast() {
    final newValue = !state.enableHighContrast;
    state = state.copyWith(enableHighContrast: newValue);
    _savePreference('enableHighContrast', newValue);
  }

  void setFontSize(double fontSize) {
    state = state.copyWith(fontSize: fontSize.clamp(0.8, 2.0));
    _savePreference('fontSize', fontSize);
  }

  // Performance Settings
  void toggleLazyLoading() {
    final newValue = !state.enableLazyLoading;
    state = state.copyWith(enableLazyLoading: newValue);
    _savePreference('enableLazyLoading', newValue);
  }

  void toggleImageOptimization() {
    final newValue = !state.enableImageOptimization;
    state = state.copyWith(enableImageOptimization: newValue);
    _savePreference('enableImageOptimization', newValue);
  }

  // Privacy Settings
  void toggleAnalytics() {
    final newValue = !state.enableAnalytics;
    state = state.copyWith(enableAnalytics: newValue);
    _savePreference('enableAnalytics', newValue);
  }

  void toggleCookies() {
    final newValue = !state.enableCookies;
    state = state.copyWith(enableCookies: newValue);
    _savePreference('enableCookies', newValue);
  }

  void toggleNotifications() {
    final newValue = !state.enableNotifications;
    state = state.copyWith(enableNotifications: newValue);
    _savePreference('enableNotifications', newValue);
  }

  // Language & Localization
  void setLanguage(String language) {
    state = state.copyWith(language: language);
    _savePreference('language', language);
  }

  // Global State Management
  void setGlobalLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String error) {
    state = state.copyWith(error: error);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void setSuccessMessage(String message) {
    state = state.copyWith(successMessage: message);
  }

  void clearSuccessMessage() {
    state = state.copyWith(successMessage: null);
  }

  // Connectivity
  void setOnlineStatus(bool isOnline) {
    state = state.copyWith(isOnline: isOnline);
  }

  // Bulk Settings Update
  void updateSettings({
    bool? enableAnimations,
    bool? enableParallax,
    bool? enableSoundEffects,
    bool? enableNotifications,
    bool? enableAnalytics,
    bool? enableCookies,
    bool? enableLazyLoading,
    bool? enableImageOptimization,
    bool? enableHighContrast,
    bool? enableReducedMotion,
    double? fontSize,
    String? language,
    String? themeMode,
  }) {
    state = state.copyWith(
      enableAnimations: enableAnimations ?? state.enableAnimations,
      enableParallax: enableParallax ?? state.enableParallax,
      enableSoundEffects: enableSoundEffects ?? state.enableSoundEffects,
      enableNotifications: enableNotifications ?? state.enableNotifications,
      enableAnalytics: enableAnalytics ?? state.enableAnalytics,
      enableCookies: enableCookies ?? state.enableCookies,
      enableLazyLoading: enableLazyLoading ?? state.enableLazyLoading,
      enableImageOptimization:
          enableImageOptimization ?? state.enableImageOptimization,
      enableHighContrast: enableHighContrast ?? state.enableHighContrast,
      enableReducedMotion: enableReducedMotion ?? state.enableReducedMotion,
      fontSize: fontSize ?? state.fontSize,
      language: language ?? state.language,
    );

    _saveAllPreferences();
  }

  // Reset to defaults
  void resetSettings() {
    state = const PortfolioState();
    _clearAllPreferences();
  }

  // Private helper methods
  Future<void> _loadUserPreferences() async {
    if (_localStorage == null) return;

    try {
      final enableAnimations =
          await _localStorage.getBool('enableAnimations') ?? true;
      final enableParallax =
          await _localStorage.getBool('enableParallax') ?? true;
      final enableSoundEffects =
          await _localStorage.getBool('enableSoundEffects') ?? true;
      await _localStorage.getBool('enableSoundEffects') ?? true;
      final enableNotifications =
          await _localStorage.getBool('enableNotifications') ?? true;
      final enableAnalytics =
          await _localStorage.getBool('enableAnalytics') ?? true;
      final enableCookies =
          await _localStorage.getBool('enableCookies') ?? true;
      final enableLazyLoading =
          await _localStorage.getBool('enableLazyLoading') ?? true;
      final enableImageOptimization =
          await _localStorage.getBool('enableImageOptimization') ?? true;
      final enableHighContrast =
          await _localStorage.getBool('enableHighContrast') ?? false;
      final enableReducedMotion =
          await _localStorage.getBool('enableReducedMotion') ?? false;
      final fontSize = await _localStorage.getDouble('fontSize') ?? 1.0;
      final language = await _localStorage.getString('language') ?? 'en';
      final isFirstLaunch =
          await _localStorage.getBool('isFirstLaunch') ?? true;

      state = state.copyWith(
        enableAnimations: enableAnimations,
        enableParallax: enableParallax,
        enableSoundEffects: enableSoundEffects,
        enableNotifications: enableNotifications,
        enableAnalytics: enableAnalytics,
        enableCookies: enableCookies,
        enableLazyLoading: enableLazyLoading,
        enableImageOptimization: enableImageOptimization,
        enableHighContrast: enableHighContrast,
        enableReducedMotion: enableReducedMotion,
        fontSize: fontSize,
        language: language,
        isFirstLaunch: isFirstLaunch,
      );

      if (isFirstLaunch) {
        await _localStorage.setBool('isFirstLaunch', false);
      }
    } catch (e) {
      // Handle error loading preferences
      debugPrint('Error loading preferences: $e');
    }
  }

  void _detectDeviceType() {
    // This would be called from UI with MediaQuery data
    // For now, we'll set defaults
  }

  Future<void> _savePreference(String key, dynamic value) async {
    if (_localStorage == null) return;

    try {
      if (value is bool) {
        await _localStorage.setBool(key, value);
      } else if (value is String) {
        await _localStorage.setString(key, value);
      } else if (value is double) {
        await _localStorage.setDouble(key, value);
      } else if (value is int) {
        await _localStorage.setInt(key, value);
      }
    } catch (e) {
      debugPrint('Error saving preference $key: $e');
    }
  }

  Future<void> _saveAllPreferences() async {
    await Future.wait([
      _savePreference('enableAnimations', state.enableAnimations),
      _savePreference('enableParallax', state.enableParallax),
      _savePreference('enableSoundEffects', state.enableSoundEffects),
      _savePreference('enableNotifications', state.enableNotifications),
      _savePreference('enableAnalytics', state.enableAnalytics),
      _savePreference('enableCookies', state.enableCookies),
      _savePreference('enableLazyLoading', state.enableLazyLoading),
      _savePreference('enableImageOptimization', state.enableImageOptimization),
      _savePreference('enableHighContrast', state.enableHighContrast),
      _savePreference('enableReducedMotion', state.enableReducedMotion),
      _savePreference('fontSize', state.fontSize),
      _savePreference('language', state.language),
    ]);
  }

  Future<void> _clearAllPreferences() async {
    if (_localStorage == null) return;
    await _localStorage.clear();
  }
}