import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_state.freezed.dart';
part 'portfolio_state.g.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    // Navigation & Scroll
    @Default(0) int currentSection,
    @Default(0.0) double scrollOffset,
    @Default(false) bool isAutoScrolling,

    // Theme & UI
    @Default(false) bool isMenuOpen,
    @Default(false) bool isLoading,

    // Responsive & Layout
    @Default(false) bool isMobileView,
    @Default(false) bool isTabletView,
    @Default(false) bool isDesktopView,

    // App Settings & Preferences
    @Default(true) bool enableAnimations,
    @Default(true) bool enableParallax,
    @Default(true) bool enableSoundEffects,
    @Default(true) bool enableNotifications,
    @Default(true) bool enableAnalytics,
    @Default(true) bool enableCookies,
    @Default(true) bool enableLazyLoading,
    @Default(true) bool enableImageOptimization,

    // Localization & Accessibility
    @Default('en') String language,
    @Default(1.0) double fontSize, // Font size multiplier
    @Default(false) bool enableHighContrast,
    @Default(false) bool enableReducedMotion,

    // Global Error & Success Handling
    String? error,
    String? successMessage,

    // App State & Lifecycle
    @Default(false) bool isInitialized,
    @Default(false) bool isOnline,
    @Default(false) bool isFirstLaunch,
    DateTime? lastUpdated,
  }) = _PortfolioState;

  factory PortfolioState.fromJson(Map<String, dynamic> json) =>
      _$PortfolioStateFromJson(json);
}

extension PortfolioStateDevice on PortfolioState {
  bool get isDesktop => isDesktopView;
  bool get isTablet => isTabletView;
  bool get isMobile => isMobileView;
}

extension PortfolioStateSettings on PortfolioState {
  bool get animationsEnabled => enableAnimations && !enableReducedMotion;
  bool get parallaxEnabled => enableParallax && !enableReducedMotion;

  double getEffectiveFontSize(double baseFontSize) {
    return baseFontSize * fontSize;
  }

  bool get shouldShowAnimations => enableAnimations && !enableReducedMotion;
  bool get shouldOptimizeImages => enableImageOptimization || isMobile;
  bool get shouldUseLazyLoading => enableLazyLoading || isMobile;
}