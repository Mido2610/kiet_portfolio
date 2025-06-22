// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PortfolioState _$PortfolioStateFromJson(Map<String, dynamic> json) {
  return _PortfolioState.fromJson(json);
}

/// @nodoc
mixin _$PortfolioState {
  // Navigation & Scroll
  int get currentSection => throw _privateConstructorUsedError;
  double get scrollOffset => throw _privateConstructorUsedError;
  bool get isAutoScrolling => throw _privateConstructorUsedError; // Theme & UI
  bool get isMenuOpen => throw _privateConstructorUsedError;
  bool get isLoading =>
      throw _privateConstructorUsedError; // Responsive & Layout
  bool get isMobileView => throw _privateConstructorUsedError;
  bool get isTabletView => throw _privateConstructorUsedError;
  bool get isDesktopView =>
      throw _privateConstructorUsedError; // App Settings & Preferences
  bool get enableLazyLoading =>
      throw _privateConstructorUsedError; // Global Error & Success Handling
  String? get error => throw _privateConstructorUsedError;
  String? get successMessage =>
      throw _privateConstructorUsedError; // App State & Lifecycle
  bool get isInitialized => throw _privateConstructorUsedError;

  /// Serializes this PortfolioState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioStateCopyWith<PortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioStateCopyWith<$Res> {
  factory $PortfolioStateCopyWith(
    PortfolioState value,
    $Res Function(PortfolioState) then,
  ) = _$PortfolioStateCopyWithImpl<$Res, PortfolioState>;
  @useResult
  $Res call({
    int currentSection,
    double scrollOffset,
    bool isAutoScrolling,
    bool isMenuOpen,
    bool isLoading,
    bool isMobileView,
    bool isTabletView,
    bool isDesktopView,
    bool enableLazyLoading,
    String? error,
    String? successMessage,
    bool isInitialized,
  });
}

/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res, $Val extends PortfolioState>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSection = null,
    Object? scrollOffset = null,
    Object? isAutoScrolling = null,
    Object? isMenuOpen = null,
    Object? isLoading = null,
    Object? isMobileView = null,
    Object? isTabletView = null,
    Object? isDesktopView = null,
    Object? enableLazyLoading = null,
    Object? error = freezed,
    Object? successMessage = freezed,
    Object? isInitialized = null,
  }) {
    return _then(
      _value.copyWith(
            currentSection:
                null == currentSection
                    ? _value.currentSection
                    : currentSection // ignore: cast_nullable_to_non_nullable
                        as int,
            scrollOffset:
                null == scrollOffset
                    ? _value.scrollOffset
                    : scrollOffset // ignore: cast_nullable_to_non_nullable
                        as double,
            isAutoScrolling:
                null == isAutoScrolling
                    ? _value.isAutoScrolling
                    : isAutoScrolling // ignore: cast_nullable_to_non_nullable
                        as bool,
            isMenuOpen:
                null == isMenuOpen
                    ? _value.isMenuOpen
                    : isMenuOpen // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isMobileView:
                null == isMobileView
                    ? _value.isMobileView
                    : isMobileView // ignore: cast_nullable_to_non_nullable
                        as bool,
            isTabletView:
                null == isTabletView
                    ? _value.isTabletView
                    : isTabletView // ignore: cast_nullable_to_non_nullable
                        as bool,
            isDesktopView:
                null == isDesktopView
                    ? _value.isDesktopView
                    : isDesktopView // ignore: cast_nullable_to_non_nullable
                        as bool,
            enableLazyLoading:
                null == enableLazyLoading
                    ? _value.enableLazyLoading
                    : enableLazyLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            successMessage:
                freezed == successMessage
                    ? _value.successMessage
                    : successMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            isInitialized:
                null == isInitialized
                    ? _value.isInitialized
                    : isInitialized // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PortfolioStateImplCopyWith<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  factory _$$PortfolioStateImplCopyWith(
    _$PortfolioStateImpl value,
    $Res Function(_$PortfolioStateImpl) then,
  ) = __$$PortfolioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentSection,
    double scrollOffset,
    bool isAutoScrolling,
    bool isMenuOpen,
    bool isLoading,
    bool isMobileView,
    bool isTabletView,
    bool isDesktopView,
    bool enableLazyLoading,
    String? error,
    String? successMessage,
    bool isInitialized,
  });
}

/// @nodoc
class __$$PortfolioStateImplCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res, _$PortfolioStateImpl>
    implements _$$PortfolioStateImplCopyWith<$Res> {
  __$$PortfolioStateImplCopyWithImpl(
    _$PortfolioStateImpl _value,
    $Res Function(_$PortfolioStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSection = null,
    Object? scrollOffset = null,
    Object? isAutoScrolling = null,
    Object? isMenuOpen = null,
    Object? isLoading = null,
    Object? isMobileView = null,
    Object? isTabletView = null,
    Object? isDesktopView = null,
    Object? enableLazyLoading = null,
    Object? error = freezed,
    Object? successMessage = freezed,
    Object? isInitialized = null,
  }) {
    return _then(
      _$PortfolioStateImpl(
        currentSection:
            null == currentSection
                ? _value.currentSection
                : currentSection // ignore: cast_nullable_to_non_nullable
                    as int,
        scrollOffset:
            null == scrollOffset
                ? _value.scrollOffset
                : scrollOffset // ignore: cast_nullable_to_non_nullable
                    as double,
        isAutoScrolling:
            null == isAutoScrolling
                ? _value.isAutoScrolling
                : isAutoScrolling // ignore: cast_nullable_to_non_nullable
                    as bool,
        isMenuOpen:
            null == isMenuOpen
                ? _value.isMenuOpen
                : isMenuOpen // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isMobileView:
            null == isMobileView
                ? _value.isMobileView
                : isMobileView // ignore: cast_nullable_to_non_nullable
                    as bool,
        isTabletView:
            null == isTabletView
                ? _value.isTabletView
                : isTabletView // ignore: cast_nullable_to_non_nullable
                    as bool,
        isDesktopView:
            null == isDesktopView
                ? _value.isDesktopView
                : isDesktopView // ignore: cast_nullable_to_non_nullable
                    as bool,
        enableLazyLoading:
            null == enableLazyLoading
                ? _value.enableLazyLoading
                : enableLazyLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        successMessage:
            freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        isInitialized:
            null == isInitialized
                ? _value.isInitialized
                : isInitialized // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioStateImpl implements _PortfolioState {
  const _$PortfolioStateImpl({
    this.currentSection = 0,
    this.scrollOffset = 0.0,
    this.isAutoScrolling = false,
    this.isMenuOpen = false,
    this.isLoading = false,
    this.isMobileView = false,
    this.isTabletView = false,
    this.isDesktopView = false,
    this.enableLazyLoading = true,
    this.error,
    this.successMessage,
    this.isInitialized = false,
  });

  factory _$PortfolioStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioStateImplFromJson(json);

  // Navigation & Scroll
  @override
  @JsonKey()
  final int currentSection;
  @override
  @JsonKey()
  final double scrollOffset;
  @override
  @JsonKey()
  final bool isAutoScrolling;
  // Theme & UI
  @override
  @JsonKey()
  final bool isMenuOpen;
  @override
  @JsonKey()
  final bool isLoading;
  // Responsive & Layout
  @override
  @JsonKey()
  final bool isMobileView;
  @override
  @JsonKey()
  final bool isTabletView;
  @override
  @JsonKey()
  final bool isDesktopView;
  // App Settings & Preferences
  @override
  @JsonKey()
  final bool enableLazyLoading;
  // Global Error & Success Handling
  @override
  final String? error;
  @override
  final String? successMessage;
  // App State & Lifecycle
  @override
  @JsonKey()
  final bool isInitialized;

  @override
  String toString() {
    return 'PortfolioState(currentSection: $currentSection, scrollOffset: $scrollOffset, isAutoScrolling: $isAutoScrolling, isMenuOpen: $isMenuOpen, isLoading: $isLoading, isMobileView: $isMobileView, isTabletView: $isTabletView, isDesktopView: $isDesktopView, enableLazyLoading: $enableLazyLoading, error: $error, successMessage: $successMessage, isInitialized: $isInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioStateImpl &&
            (identical(other.currentSection, currentSection) ||
                other.currentSection == currentSection) &&
            (identical(other.scrollOffset, scrollOffset) ||
                other.scrollOffset == scrollOffset) &&
            (identical(other.isAutoScrolling, isAutoScrolling) ||
                other.isAutoScrolling == isAutoScrolling) &&
            (identical(other.isMenuOpen, isMenuOpen) ||
                other.isMenuOpen == isMenuOpen) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMobileView, isMobileView) ||
                other.isMobileView == isMobileView) &&
            (identical(other.isTabletView, isTabletView) ||
                other.isTabletView == isTabletView) &&
            (identical(other.isDesktopView, isDesktopView) ||
                other.isDesktopView == isDesktopView) &&
            (identical(other.enableLazyLoading, enableLazyLoading) ||
                other.enableLazyLoading == enableLazyLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentSection,
    scrollOffset,
    isAutoScrolling,
    isMenuOpen,
    isLoading,
    isMobileView,
    isTabletView,
    isDesktopView,
    enableLazyLoading,
    error,
    successMessage,
    isInitialized,
  );

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioStateImplCopyWith<_$PortfolioStateImpl> get copyWith =>
      __$$PortfolioStateImplCopyWithImpl<_$PortfolioStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioStateImplToJson(this);
  }
}

abstract class _PortfolioState implements PortfolioState {
  const factory _PortfolioState({
    final int currentSection,
    final double scrollOffset,
    final bool isAutoScrolling,
    final bool isMenuOpen,
    final bool isLoading,
    final bool isMobileView,
    final bool isTabletView,
    final bool isDesktopView,
    final bool enableLazyLoading,
    final String? error,
    final String? successMessage,
    final bool isInitialized,
  }) = _$PortfolioStateImpl;

  factory _PortfolioState.fromJson(Map<String, dynamic> json) =
      _$PortfolioStateImpl.fromJson;

  // Navigation & Scroll
  @override
  int get currentSection;
  @override
  double get scrollOffset;
  @override
  bool get isAutoScrolling; // Theme & UI
  @override
  bool get isMenuOpen;
  @override
  bool get isLoading; // Responsive & Layout
  @override
  bool get isMobileView;
  @override
  bool get isTabletView;
  @override
  bool get isDesktopView; // App Settings & Preferences
  @override
  bool get enableLazyLoading; // Global Error & Success Handling
  @override
  String? get error;
  @override
  String? get successMessage; // App State & Lifecycle
  @override
  bool get isInitialized;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioStateImplCopyWith<_$PortfolioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
