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
    state = state.copyWith(isInitialized: true);
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

  // Lazy Loading Management
  void toggleLazyLoading() {
    state = state.copyWith(
      enableLazyLoading: !state.enableLazyLoading,
    );
    _localStorage?.setBool('lazy_loading', state.enableLazyLoading);
  }

  // Private helper methods
  Future<void> _loadUserPreferences() async {
    if (_localStorage == null) return;

    try {
      final lazyLoading = await _localStorage.getBool('lazy_loading') ?? true;
      
      state = state.copyWith(
        enableLazyLoading: lazyLoading,
      );
    } catch (e) {
      debugPrint('Error loading preferences: $e');
    }
  }

  void _detectDeviceType() {
    // This would be called from UI with MediaQuery data
    // For now, we'll set defaults
  }
}