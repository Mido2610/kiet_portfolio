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

// Performance Providers
final enableLazyLoadingProvider = Provider<bool>((ref) {
  return ref.watch(
    portfolioProvider.select((state) => state.enableLazyLoading),
  );
});

// State Providers
final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.isLoading));
});

final errorProvider = Provider<String?>((ref) {
  return ref.watch(portfolioProvider.select((state) => state.error));
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

  void toggleLazyLoading() =>
      _ref.read(portfolioProvider.notifier).toggleLazyLoading();
  void toggleMenu() =>
      _ref.read(portfolioProvider.notifier).toggleMenu();
  void closeMenu() =>
      _ref.read(portfolioProvider.notifier).closeMenu();
  void updateCurrentSection(int section) =>
      _ref.read(portfolioProvider.notifier).updateCurrentSection(section);
  void setAutoScrolling(bool isScrolling) =>
      _ref.read(portfolioProvider.notifier).setAutoScrolling(isScrolling);
  void updateDeviceType({
    required bool isMobile,
    required bool isTablet,
    required bool isDesktop,
  }) =>
      _ref.read(portfolioProvider.notifier).updateDeviceType(
        isMobile: isMobile,
        isTablet: isTablet,
        isDesktop: isDesktop,
      );
}