import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/providers/core_provider.dart';
import 'package:kiet_portfolio/presentation/state_management/notifiers/portfolio_notifier.dart';
import 'package:kiet_portfolio/presentation/state_management/state/portfolio_state.dart';

// Main Portfolio Provider
final portfolioProvider =
    StateNotifierProvider<PortfolioNotifier, PortfolioState>(
      (ref) => PortfolioNotifier(
        localStorage: ref.watch(localStorageServiceProvider),
      ),
    );

final isMenuOpenProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isMenuOpen));
});

// Navigation Providers
final currentSectionProvider = Provider<int>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.currentSection));
});

final scrollOffsetProvider = Provider<double>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.scrollOffset));
});

// Device Providers
final isMobileViewProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isMobileView));
});

final isTabletViewProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isTabletView));
});

final isDesktopViewProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isDesktopView));
});

// Settings Providers
final enableAnimationsProvider = Provider<bool>((ref) {
  return ref.watch(
    portfolioProvider.select((state) => state.animationsEnabled),
  );
});

final enableParallaxProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.parallaxEnabled));
});

final fontSizeProvider = Provider<double>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.fontSize));
});

final languageProvider = Provider<String>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.language));
});

// Accessibility Providers
final enableHighContrastProvider = Provider<bool>((ref) {
  return ref.watch(
    portfolioProvider.select((state) => state.enableHighContrast),
  );
});

final enableReducedMotionProvider = Provider<bool>((ref) {
  return ref.watch(
    portfolioProvider.select((state) => state.enableReducedMotion),
  );
});

// Performance Providers
final enableLazyLoadingProvider = Provider<bool>((ref) {
  return ref.watch(
    portfolioProvider.select((state) => state.shouldUseLazyLoading),
  );
});

final enableImageOptimizationProvider = Provider<bool>((ref) {
  return ref.watch(
    portfolioProvider.select((state) => state.shouldOptimizeImages),
  );
});

// State Providers
final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isLoading));
});

final errorProvider = Provider<String?>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.error));
});

final successMessageProvider = Provider<String?>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.successMessage));
});

final isOnlineProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isOnline));
});

final isInitializedProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isInitialized));
});

// Scroll Controller Provider
final scrollControllerProvider = Provider<ScrollController>((ref) {
  final controller = ScrollController();

  controller.addListener(() {
    ref.read(portfolioProvider.notifier).updateScrollOffset(controller.offset);
  });

  ref.onDispose(() => controller.dispose());
  return controller;
});

// Settings Helper Providers
final appSettingsProvider = Provider<AppSettingsHelper>((ref) {
  return AppSettingsHelper(ref);
});

class AppSettingsHelper {
  final Ref _ref;

  AppSettingsHelper(this._ref);

  void toggleAnimations() =>
      _ref.read(portfolioProvider.notifier).toggleAnimations();
  void toggleParallax() =>
      _ref.read(portfolioProvider.notifier).toggleParallax();
  void toggleSoundEffects() =>
      _ref.read(portfolioProvider.notifier).toggleSoundEffects();
  void toggleNotifications() =>
      _ref.read(portfolioProvider.notifier).toggleNotifications();
  void toggleHighContrast() =>
      _ref.read(portfolioProvider.notifier).toggleHighContrast();
  void toggleReducedMotion() =>
      _ref.read(portfolioProvider.notifier).toggleReducedMotion();
  void setFontSize(double size) =>
      _ref.read(portfolioProvider.notifier).setFontSize(size);
  void setLanguage(String lang) =>
      _ref.read(portfolioProvider.notifier).setLanguage(lang);
  void resetSettings() => _ref.read(portfolioProvider.notifier).resetSettings();
}