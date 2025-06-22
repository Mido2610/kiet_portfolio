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
    @Default(true) bool enableLazyLoading,

    // Global Error & Success Handling
    String? error,
    String? successMessage,

    // App State & Lifecycle
    @Default(false) bool isInitialized,
  }) = _PortfolioState;

  factory PortfolioState.fromJson(Map<String, dynamic> json) =>
      _$PortfolioStateFromJson(json);
}

extension PortfolioStateDevice on PortfolioState {
  bool get isDesktop => isDesktopView;
  bool get isTablet => isTabletView;
  bool get isMobile => isMobileView;
}