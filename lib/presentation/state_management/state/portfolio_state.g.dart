// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioStateImpl _$$PortfolioStateImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioStateImpl(
      currentSection: (json['currentSection'] as num?)?.toInt() ?? 0,
      scrollOffset: (json['scrollOffset'] as num?)?.toDouble() ?? 0.0,
      isAutoScrolling: json['isAutoScrolling'] as bool? ?? false,
      isMenuOpen: json['isMenuOpen'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      isMobileView: json['isMobileView'] as bool? ?? false,
      isTabletView: json['isTabletView'] as bool? ?? false,
      isDesktopView: json['isDesktopView'] as bool? ?? false,
      enableAnimations: json['enableAnimations'] as bool? ?? true,
      enableParallax: json['enableParallax'] as bool? ?? true,
      enableSoundEffects: json['enableSoundEffects'] as bool? ?? true,
      enableNotifications: json['enableNotifications'] as bool? ?? true,
      enableAnalytics: json['enableAnalytics'] as bool? ?? true,
      enableCookies: json['enableCookies'] as bool? ?? true,
      enableLazyLoading: json['enableLazyLoading'] as bool? ?? true,
      enableImageOptimization: json['enableImageOptimization'] as bool? ?? true,
      language: json['language'] as String? ?? 'en',
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 1.0,
      enableHighContrast: json['enableHighContrast'] as bool? ?? false,
      enableReducedMotion: json['enableReducedMotion'] as bool? ?? false,
      error: json['error'] as String?,
      successMessage: json['successMessage'] as String?,
      isInitialized: json['isInitialized'] as bool? ?? false,
      isOnline: json['isOnline'] as bool? ?? false,
      isFirstLaunch: json['isFirstLaunch'] as bool? ?? false,
      lastUpdated:
          json['lastUpdated'] == null
              ? null
              : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$PortfolioStateImplToJson(
  _$PortfolioStateImpl instance,
) => <String, dynamic>{
  'currentSection': instance.currentSection,
  'scrollOffset': instance.scrollOffset,
  'isAutoScrolling': instance.isAutoScrolling,
  'isMenuOpen': instance.isMenuOpen,
  'isLoading': instance.isLoading,
  'isMobileView': instance.isMobileView,
  'isTabletView': instance.isTabletView,
  'isDesktopView': instance.isDesktopView,
  'enableAnimations': instance.enableAnimations,
  'enableParallax': instance.enableParallax,
  'enableSoundEffects': instance.enableSoundEffects,
  'enableNotifications': instance.enableNotifications,
  'enableAnalytics': instance.enableAnalytics,
  'enableCookies': instance.enableCookies,
  'enableLazyLoading': instance.enableLazyLoading,
  'enableImageOptimization': instance.enableImageOptimization,
  'language': instance.language,
  'fontSize': instance.fontSize,
  'enableHighContrast': instance.enableHighContrast,
  'enableReducedMotion': instance.enableReducedMotion,
  'error': instance.error,
  'successMessage': instance.successMessage,
  'isInitialized': instance.isInitialized,
  'isOnline': instance.isOnline,
  'isFirstLaunch': instance.isFirstLaunch,
  'lastUpdated': instance.lastUpdated?.toIso8601String(),
};
