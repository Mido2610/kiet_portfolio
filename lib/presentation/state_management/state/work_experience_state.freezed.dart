// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_experience_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkExperienceState _$WorkExperienceStateFromJson(Map<String, dynamic> json) {
  return _WorkExperienceState.fromJson(json);
}

/// @nodoc
mixin _$WorkExperienceState {
  List<Experience> get experiences => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get selectedCompany => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this WorkExperienceState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkExperienceStateCopyWith<WorkExperienceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkExperienceStateCopyWith<$Res> {
  factory $WorkExperienceStateCopyWith(
    WorkExperienceState value,
    $Res Function(WorkExperienceState) then,
  ) = _$WorkExperienceStateCopyWithImpl<$Res, WorkExperienceState>;
  @useResult
  $Res call({
    List<Experience> experiences,
    bool isLoading,
    String selectedCompany,
    String? error,
  });
}

/// @nodoc
class _$WorkExperienceStateCopyWithImpl<$Res, $Val extends WorkExperienceState>
    implements $WorkExperienceStateCopyWith<$Res> {
  _$WorkExperienceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experiences = null,
    Object? isLoading = null,
    Object? selectedCompany = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            experiences:
                null == experiences
                    ? _value.experiences
                    : experiences // ignore: cast_nullable_to_non_nullable
                        as List<Experience>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedCompany:
                null == selectedCompany
                    ? _value.selectedCompany
                    : selectedCompany // ignore: cast_nullable_to_non_nullable
                        as String,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkExperienceStateImplCopyWith<$Res>
    implements $WorkExperienceStateCopyWith<$Res> {
  factory _$$WorkExperienceStateImplCopyWith(
    _$WorkExperienceStateImpl value,
    $Res Function(_$WorkExperienceStateImpl) then,
  ) = __$$WorkExperienceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Experience> experiences,
    bool isLoading,
    String selectedCompany,
    String? error,
  });
}

/// @nodoc
class __$$WorkExperienceStateImplCopyWithImpl<$Res>
    extends _$WorkExperienceStateCopyWithImpl<$Res, _$WorkExperienceStateImpl>
    implements _$$WorkExperienceStateImplCopyWith<$Res> {
  __$$WorkExperienceStateImplCopyWithImpl(
    _$WorkExperienceStateImpl _value,
    $Res Function(_$WorkExperienceStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experiences = null,
    Object? isLoading = null,
    Object? selectedCompany = null,
    Object? error = freezed,
  }) {
    return _then(
      _$WorkExperienceStateImpl(
        experiences:
            null == experiences
                ? _value._experiences
                : experiences // ignore: cast_nullable_to_non_nullable
                    as List<Experience>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedCompany:
            null == selectedCompany
                ? _value.selectedCompany
                : selectedCompany // ignore: cast_nullable_to_non_nullable
                    as String,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkExperienceStateImpl implements _WorkExperienceState {
  const _$WorkExperienceStateImpl({
    final List<Experience> experiences = const [],
    this.isLoading = false,
    this.selectedCompany = '',
    this.error,
  }) : _experiences = experiences;

  factory _$WorkExperienceStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkExperienceStateImplFromJson(json);

  final List<Experience> _experiences;
  @override
  @JsonKey()
  List<Experience> get experiences {
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experiences);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String selectedCompany;
  @override
  final String? error;

  @override
  String toString() {
    return 'WorkExperienceState(experiences: $experiences, isLoading: $isLoading, selectedCompany: $selectedCompany, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkExperienceStateImpl &&
            const DeepCollectionEquality().equals(
              other._experiences,
              _experiences,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedCompany, selectedCompany) ||
                other.selectedCompany == selectedCompany) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_experiences),
    isLoading,
    selectedCompany,
    error,
  );

  /// Create a copy of WorkExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkExperienceStateImplCopyWith<_$WorkExperienceStateImpl> get copyWith =>
      __$$WorkExperienceStateImplCopyWithImpl<_$WorkExperienceStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkExperienceStateImplToJson(this);
  }
}

abstract class _WorkExperienceState implements WorkExperienceState {
  const factory _WorkExperienceState({
    final List<Experience> experiences,
    final bool isLoading,
    final String selectedCompany,
    final String? error,
  }) = _$WorkExperienceStateImpl;

  factory _WorkExperienceState.fromJson(Map<String, dynamic> json) =
      _$WorkExperienceStateImpl.fromJson;

  @override
  List<Experience> get experiences;
  @override
  bool get isLoading;
  @override
  String get selectedCompany;
  @override
  String? get error;

  /// Create a copy of WorkExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkExperienceStateImplCopyWith<_$WorkExperienceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
