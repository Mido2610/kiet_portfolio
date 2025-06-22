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
      enableLazyLoading: json['enableLazyLoading'] as bool? ?? true,
      error: json['error'] as String?,
      successMessage: json['successMessage'] as String?,
      isInitialized: json['isInitialized'] as bool? ?? false,
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
  'enableLazyLoading': instance.enableLazyLoading,
  'error': instance.error,
  'successMessage': instance.successMessage,
  'isInitialized': instance.isInitialized,
};
