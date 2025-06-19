// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SkillsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Skill> get skills => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of SkillsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillsStateCopyWith<SkillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsStateCopyWith<$Res> {
  factory $SkillsStateCopyWith(
    SkillsState value,
    $Res Function(SkillsState) then,
  ) = _$SkillsStateCopyWithImpl<$Res, SkillsState>;
  @useResult
  $Res call({
    bool isLoading,
    List<Skill> skills,
    String selectedCategory,
    String? error,
  });
}

/// @nodoc
class _$SkillsStateCopyWithImpl<$Res, $Val extends SkillsState>
    implements $SkillsStateCopyWith<$Res> {
  _$SkillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? skills = null,
    Object? selectedCategory = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            skills:
                null == skills
                    ? _value.skills
                    : skills // ignore: cast_nullable_to_non_nullable
                        as List<Skill>,
            selectedCategory:
                null == selectedCategory
                    ? _value.selectedCategory
                    : selectedCategory // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SkillsStateImplCopyWith<$Res>
    implements $SkillsStateCopyWith<$Res> {
  factory _$$SkillsStateImplCopyWith(
    _$SkillsStateImpl value,
    $Res Function(_$SkillsStateImpl) then,
  ) = __$$SkillsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<Skill> skills,
    String selectedCategory,
    String? error,
  });
}

/// @nodoc
class __$$SkillsStateImplCopyWithImpl<$Res>
    extends _$SkillsStateCopyWithImpl<$Res, _$SkillsStateImpl>
    implements _$$SkillsStateImplCopyWith<$Res> {
  __$$SkillsStateImplCopyWithImpl(
    _$SkillsStateImpl _value,
    $Res Function(_$SkillsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SkillsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? skills = null,
    Object? selectedCategory = null,
    Object? error = freezed,
  }) {
    return _then(
      _$SkillsStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        skills:
            null == skills
                ? _value._skills
                : skills // ignore: cast_nullable_to_non_nullable
                    as List<Skill>,
        selectedCategory:
            null == selectedCategory
                ? _value.selectedCategory
                : selectedCategory // ignore: cast_nullable_to_non_nullable
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

class _$SkillsStateImpl implements _SkillsState {
  const _$SkillsStateImpl({
    this.isLoading = false,
    final List<Skill> skills = const [],
    this.selectedCategory = 'All',
    this.error,
  }) : _skills = skills;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Skill> _skills;
  @override
  @JsonKey()
  List<Skill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey()
  final String selectedCategory;
  @override
  final String? error;

  @override
  String toString() {
    return 'SkillsState(isLoading: $isLoading, skills: $skills, selectedCategory: $selectedCategory, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_skills),
    selectedCategory,
    error,
  );

  /// Create a copy of SkillsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillsStateImplCopyWith<_$SkillsStateImpl> get copyWith =>
      __$$SkillsStateImplCopyWithImpl<_$SkillsStateImpl>(this, _$identity);
}

abstract class _SkillsState implements SkillsState {
  const factory _SkillsState({
    final bool isLoading,
    final List<Skill> skills,
    final String selectedCategory,
    final String? error,
  }) = _$SkillsStateImpl;

  @override
  bool get isLoading;
  @override
  List<Skill> get skills;
  @override
  String get selectedCategory;
  @override
  String? get error;

  /// Create a copy of SkillsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillsStateImplCopyWith<_$SkillsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
