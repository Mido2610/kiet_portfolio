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
  int get currentSection => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;
  List<Skill> get skills => throw _privateConstructorUsedError;
  List<Experience> get experiences => throw _privateConstructorUsedError;
  double get scrollOffset => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;
  String get selectedFilter => throw _privateConstructorUsedError;
  bool get isMenuOpen => throw _privateConstructorUsedError;

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
    bool isLoading,
    List<Project> projects,
    List<Skill> skills,
    List<Experience> experiences,
    double scrollOffset,
    bool isDarkMode,
    String selectedFilter,
    bool isMenuOpen,
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
    Object? isLoading = null,
    Object? projects = null,
    Object? skills = null,
    Object? experiences = null,
    Object? scrollOffset = null,
    Object? isDarkMode = null,
    Object? selectedFilter = null,
    Object? isMenuOpen = null,
  }) {
    return _then(
      _value.copyWith(
            currentSection:
                null == currentSection
                    ? _value.currentSection
                    : currentSection // ignore: cast_nullable_to_non_nullable
                        as int,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            projects:
                null == projects
                    ? _value.projects
                    : projects // ignore: cast_nullable_to_non_nullable
                        as List<Project>,
            skills:
                null == skills
                    ? _value.skills
                    : skills // ignore: cast_nullable_to_non_nullable
                        as List<Skill>,
            experiences:
                null == experiences
                    ? _value.experiences
                    : experiences // ignore: cast_nullable_to_non_nullable
                        as List<Experience>,
            scrollOffset:
                null == scrollOffset
                    ? _value.scrollOffset
                    : scrollOffset // ignore: cast_nullable_to_non_nullable
                        as double,
            isDarkMode:
                null == isDarkMode
                    ? _value.isDarkMode
                    : isDarkMode // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedFilter:
                null == selectedFilter
                    ? _value.selectedFilter
                    : selectedFilter // ignore: cast_nullable_to_non_nullable
                        as String,
            isMenuOpen:
                null == isMenuOpen
                    ? _value.isMenuOpen
                    : isMenuOpen // ignore: cast_nullable_to_non_nullable
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
    bool isLoading,
    List<Project> projects,
    List<Skill> skills,
    List<Experience> experiences,
    double scrollOffset,
    bool isDarkMode,
    String selectedFilter,
    bool isMenuOpen,
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
    Object? isLoading = null,
    Object? projects = null,
    Object? skills = null,
    Object? experiences = null,
    Object? scrollOffset = null,
    Object? isDarkMode = null,
    Object? selectedFilter = null,
    Object? isMenuOpen = null,
  }) {
    return _then(
      _$PortfolioStateImpl(
        currentSection:
            null == currentSection
                ? _value.currentSection
                : currentSection // ignore: cast_nullable_to_non_nullable
                    as int,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        projects:
            null == projects
                ? _value._projects
                : projects // ignore: cast_nullable_to_non_nullable
                    as List<Project>,
        skills:
            null == skills
                ? _value._skills
                : skills // ignore: cast_nullable_to_non_nullable
                    as List<Skill>,
        experiences:
            null == experiences
                ? _value._experiences
                : experiences // ignore: cast_nullable_to_non_nullable
                    as List<Experience>,
        scrollOffset:
            null == scrollOffset
                ? _value.scrollOffset
                : scrollOffset // ignore: cast_nullable_to_non_nullable
                    as double,
        isDarkMode:
            null == isDarkMode
                ? _value.isDarkMode
                : isDarkMode // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedFilter:
            null == selectedFilter
                ? _value.selectedFilter
                : selectedFilter // ignore: cast_nullable_to_non_nullable
                    as String,
        isMenuOpen:
            null == isMenuOpen
                ? _value.isMenuOpen
                : isMenuOpen // ignore: cast_nullable_to_non_nullable
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
    this.isLoading = false,
    final List<Project> projects = const [],
    final List<Skill> skills = const [],
    final List<Experience> experiences = const [],
    this.scrollOffset = 0.0,
    this.isDarkMode = false,
    this.selectedFilter = '',
    this.isMenuOpen = false,
  }) : _projects = projects,
       _skills = skills,
       _experiences = experiences;

  factory _$PortfolioStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioStateImplFromJson(json);

  @override
  @JsonKey()
  final int currentSection;
  @override
  @JsonKey()
  final bool isLoading;
  final List<Project> _projects;
  @override
  @JsonKey()
  List<Project> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  final List<Skill> _skills;
  @override
  @JsonKey()
  List<Skill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

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
  final double scrollOffset;
  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final String selectedFilter;
  @override
  @JsonKey()
  final bool isMenuOpen;

  @override
  String toString() {
    return 'PortfolioState(currentSection: $currentSection, isLoading: $isLoading, projects: $projects, skills: $skills, experiences: $experiences, scrollOffset: $scrollOffset, isDarkMode: $isDarkMode, selectedFilter: $selectedFilter, isMenuOpen: $isMenuOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioStateImpl &&
            (identical(other.currentSection, currentSection) ||
                other.currentSection == currentSection) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality().equals(
              other._experiences,
              _experiences,
            ) &&
            (identical(other.scrollOffset, scrollOffset) ||
                other.scrollOffset == scrollOffset) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.isMenuOpen, isMenuOpen) ||
                other.isMenuOpen == isMenuOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentSection,
    isLoading,
    const DeepCollectionEquality().hash(_projects),
    const DeepCollectionEquality().hash(_skills),
    const DeepCollectionEquality().hash(_experiences),
    scrollOffset,
    isDarkMode,
    selectedFilter,
    isMenuOpen,
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
    final bool isLoading,
    final List<Project> projects,
    final List<Skill> skills,
    final List<Experience> experiences,
    final double scrollOffset,
    final bool isDarkMode,
    final String selectedFilter,
    final bool isMenuOpen,
  }) = _$PortfolioStateImpl;

  factory _PortfolioState.fromJson(Map<String, dynamic> json) =
      _$PortfolioStateImpl.fromJson;

  @override
  int get currentSection;
  @override
  bool get isLoading;
  @override
  List<Project> get projects;
  @override
  List<Skill> get skills;
  @override
  List<Experience> get experiences;
  @override
  double get scrollOffset;
  @override
  bool get isDarkMode;
  @override
  String get selectedFilter;
  @override
  bool get isMenuOpen;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioStateImplCopyWith<_$PortfolioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get technologies => throw _privateConstructorUsedError;
  String get githubUrl => throw _privateConstructorUsedError;
  String get liveUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String imageUrl,
    List<String> technologies,
    String githubUrl,
    String liveUrl,
    String category,
    bool isFeatured,
    String videoUrl,
  });
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? technologies = null,
    Object? githubUrl = null,
    Object? liveUrl = null,
    Object? category = null,
    Object? isFeatured = null,
    Object? videoUrl = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            technologies:
                null == technologies
                    ? _value.technologies
                    : technologies // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            githubUrl:
                null == githubUrl
                    ? _value.githubUrl
                    : githubUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            liveUrl:
                null == liveUrl
                    ? _value.liveUrl
                    : liveUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            isFeatured:
                null == isFeatured
                    ? _value.isFeatured
                    : isFeatured // ignore: cast_nullable_to_non_nullable
                        as bool,
            videoUrl:
                null == videoUrl
                    ? _value.videoUrl
                    : videoUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
    _$ProjectImpl value,
    $Res Function(_$ProjectImpl) then,
  ) = __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String imageUrl,
    List<String> technologies,
    String githubUrl,
    String liveUrl,
    String category,
    bool isFeatured,
    String videoUrl,
  });
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
    _$ProjectImpl _value,
    $Res Function(_$ProjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? technologies = null,
    Object? githubUrl = null,
    Object? liveUrl = null,
    Object? category = null,
    Object? isFeatured = null,
    Object? videoUrl = null,
  }) {
    return _then(
      _$ProjectImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        technologies:
            null == technologies
                ? _value._technologies
                : technologies // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        githubUrl:
            null == githubUrl
                ? _value.githubUrl
                : githubUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        liveUrl:
            null == liveUrl
                ? _value.liveUrl
                : liveUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        isFeatured:
            null == isFeatured
                ? _value.isFeatured
                : isFeatured // ignore: cast_nullable_to_non_nullable
                    as bool,
        videoUrl:
            null == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required final List<String> technologies,
    required this.githubUrl,
    required this.liveUrl,
    required this.category,
    this.isFeatured = false,
    this.videoUrl = '',
  }) : _technologies = technologies;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String imageUrl;
  final List<String> _technologies;
  @override
  List<String> get technologies {
    if (_technologies is EqualUnmodifiableListView) return _technologies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_technologies);
  }

  @override
  final String githubUrl;
  @override
  final String liveUrl;
  @override
  final String category;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final String videoUrl;

  @override
  String toString() {
    return 'Project(id: $id, title: $title, description: $description, imageUrl: $imageUrl, technologies: $technologies, githubUrl: $githubUrl, liveUrl: $liveUrl, category: $category, isFeatured: $isFeatured, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._technologies,
              _technologies,
            ) &&
            (identical(other.githubUrl, githubUrl) ||
                other.githubUrl == githubUrl) &&
            (identical(other.liveUrl, liveUrl) || other.liveUrl == liveUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    imageUrl,
    const DeepCollectionEquality().hash(_technologies),
    githubUrl,
    liveUrl,
    category,
    isFeatured,
    videoUrl,
  );

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(this);
  }
}

abstract class _Project implements Project {
  const factory _Project({
    required final String id,
    required final String title,
    required final String description,
    required final String imageUrl,
    required final List<String> technologies,
    required final String githubUrl,
    required final String liveUrl,
    required final String category,
    final bool isFeatured,
    final String videoUrl,
  }) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  List<String> get technologies;
  @override
  String get githubUrl;
  @override
  String get liveUrl;
  @override
  String get category;
  @override
  bool get isFeatured;
  @override
  String get videoUrl;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return _Skill.fromJson(json);
}

/// @nodoc
mixin _$Skill {
  String get name => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Skill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCopyWith<Skill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCopyWith<$Res> {
  factory $SkillCopyWith(Skill value, $Res Function(Skill) then) =
      _$SkillCopyWithImpl<$Res, Skill>;
  @useResult
  $Res call({
    String name,
    double level,
    String iconPath,
    String category,
    String description,
  });
}

/// @nodoc
class _$SkillCopyWithImpl<$Res, $Val extends Skill>
    implements $SkillCopyWith<$Res> {
  _$SkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? iconPath = null,
    Object? category = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            level:
                null == level
                    ? _value.level
                    : level // ignore: cast_nullable_to_non_nullable
                        as double,
            iconPath:
                null == iconPath
                    ? _value.iconPath
                    : iconPath // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SkillImplCopyWith<$Res> implements $SkillCopyWith<$Res> {
  factory _$$SkillImplCopyWith(
    _$SkillImpl value,
    $Res Function(_$SkillImpl) then,
  ) = __$$SkillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double level,
    String iconPath,
    String category,
    String description,
  });
}

/// @nodoc
class __$$SkillImplCopyWithImpl<$Res>
    extends _$SkillCopyWithImpl<$Res, _$SkillImpl>
    implements _$$SkillImplCopyWith<$Res> {
  __$$SkillImplCopyWithImpl(
    _$SkillImpl _value,
    $Res Function(_$SkillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? iconPath = null,
    Object? category = null,
    Object? description = null,
  }) {
    return _then(
      _$SkillImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        level:
            null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                    as double,
        iconPath:
            null == iconPath
                ? _value.iconPath
                : iconPath // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillImpl implements _Skill {
  const _$SkillImpl({
    required this.name,
    required this.level,
    required this.iconPath,
    required this.category,
    this.description = '',
  });

  factory _$SkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillImplFromJson(json);

  @override
  final String name;
  @override
  final double level;
  @override
  final String iconPath;
  @override
  final String category;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'Skill(name: $name, level: $level, iconPath: $iconPath, category: $category, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, level, iconPath, category, description);

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillImplCopyWith<_$SkillImpl> get copyWith =>
      __$$SkillImplCopyWithImpl<_$SkillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillImplToJson(this);
  }
}

abstract class _Skill implements Skill {
  const factory _Skill({
    required final String name,
    required final double level,
    required final String iconPath,
    required final String category,
    final String description,
  }) = _$SkillImpl;

  factory _Skill.fromJson(Map<String, dynamic> json) = _$SkillImpl.fromJson;

  @override
  String get name;
  @override
  double get level;
  @override
  String get iconPath;
  @override
  String get category;
  @override
  String get description;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillImplCopyWith<_$SkillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return _Experience.fromJson(json);
}

/// @nodoc
mixin _$Experience {
  String get id => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get technologies => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceCopyWith<Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
    Experience value,
    $Res Function(Experience) then,
  ) = _$ExperienceCopyWithImpl<$Res, Experience>;
  @useResult
  $Res call({
    String id,
    String company,
    String position,
    String duration,
    String description,
    List<String> technologies,
    String logoUrl,
  });
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? position = null,
    Object? duration = null,
    Object? description = null,
    Object? technologies = null,
    Object? logoUrl = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            company:
                null == company
                    ? _value.company
                    : company // ignore: cast_nullable_to_non_nullable
                        as String,
            position:
                null == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as String,
            duration:
                null == duration
                    ? _value.duration
                    : duration // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            technologies:
                null == technologies
                    ? _value.technologies
                    : technologies // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            logoUrl:
                null == logoUrl
                    ? _value.logoUrl
                    : logoUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExperienceImplCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$$ExperienceImplCopyWith(
    _$ExperienceImpl value,
    $Res Function(_$ExperienceImpl) then,
  ) = __$$ExperienceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String company,
    String position,
    String duration,
    String description,
    List<String> technologies,
    String logoUrl,
  });
}

/// @nodoc
class __$$ExperienceImplCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$ExperienceImpl>
    implements _$$ExperienceImplCopyWith<$Res> {
  __$$ExperienceImplCopyWithImpl(
    _$ExperienceImpl _value,
    $Res Function(_$ExperienceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? position = null,
    Object? duration = null,
    Object? description = null,
    Object? technologies = null,
    Object? logoUrl = null,
  }) {
    return _then(
      _$ExperienceImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        company:
            null == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                    as String,
        position:
            null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as String,
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        technologies:
            null == technologies
                ? _value._technologies
                : technologies // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        logoUrl:
            null == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceImpl implements _Experience {
  const _$ExperienceImpl({
    required this.id,
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    required final List<String> technologies,
    this.logoUrl = '',
  }) : _technologies = technologies;

  factory _$ExperienceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceImplFromJson(json);

  @override
  final String id;
  @override
  final String company;
  @override
  final String position;
  @override
  final String duration;
  @override
  final String description;
  final List<String> _technologies;
  @override
  List<String> get technologies {
    if (_technologies is EqualUnmodifiableListView) return _technologies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_technologies);
  }

  @override
  @JsonKey()
  final String logoUrl;

  @override
  String toString() {
    return 'Experience(id: $id, company: $company, position: $position, duration: $duration, description: $description, technologies: $technologies, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._technologies,
              _technologies,
            ) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    company,
    position,
    duration,
    description,
    const DeepCollectionEquality().hash(_technologies),
    logoUrl,
  );

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      __$$ExperienceImplCopyWithImpl<_$ExperienceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceImplToJson(this);
  }
}

abstract class _Experience implements Experience {
  const factory _Experience({
    required final String id,
    required final String company,
    required final String position,
    required final String duration,
    required final String description,
    required final List<String> technologies,
    final String logoUrl,
  }) = _$ExperienceImpl;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$ExperienceImpl.fromJson;

  @override
  String get id;
  @override
  String get company;
  @override
  String get position;
  @override
  String get duration;
  @override
  String get description;
  @override
  List<String> get technologies;
  @override
  String get logoUrl;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

/// @nodoc
mixin _$ContactInfo {
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get linkedin => throw _privateConstructorUsedError;
  String get github => throw _privateConstructorUsedError;
  String get twitter => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// Serializes this ContactInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
    ContactInfo value,
    $Res Function(ContactInfo) then,
  ) = _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call({
    String email,
    String phone,
    String linkedin,
    String github,
    String twitter,
    String location,
  });
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? linkedin = null,
    Object? github = null,
    Object? twitter = null,
    Object? location = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            phone:
                null == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String,
            linkedin:
                null == linkedin
                    ? _value.linkedin
                    : linkedin // ignore: cast_nullable_to_non_nullable
                        as String,
            github:
                null == github
                    ? _value.github
                    : github // ignore: cast_nullable_to_non_nullable
                        as String,
            twitter:
                null == twitter
                    ? _value.twitter
                    : twitter // ignore: cast_nullable_to_non_nullable
                        as String,
            location:
                null == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
    _$ContactInfoImpl value,
    $Res Function(_$ContactInfoImpl) then,
  ) = __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String phone,
    String linkedin,
    String github,
    String twitter,
    String location,
  });
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
    _$ContactInfoImpl _value,
    $Res Function(_$ContactInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? linkedin = null,
    Object? github = null,
    Object? twitter = null,
    Object? location = null,
  }) {
    return _then(
      _$ContactInfoImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        phone:
            null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String,
        linkedin:
            null == linkedin
                ? _value.linkedin
                : linkedin // ignore: cast_nullable_to_non_nullable
                    as String,
        github:
            null == github
                ? _value.github
                : github // ignore: cast_nullable_to_non_nullable
                    as String,
        twitter:
            null == twitter
                ? _value.twitter
                : twitter // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl({
    required this.email,
    required this.phone,
    required this.linkedin,
    required this.github,
    this.twitter = '',
    this.location = '',
  });

  factory _$ContactInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoImplFromJson(json);

  @override
  final String email;
  @override
  final String phone;
  @override
  final String linkedin;
  @override
  final String github;
  @override
  @JsonKey()
  final String twitter;
  @override
  @JsonKey()
  final String location;

  @override
  String toString() {
    return 'ContactInfo(email: $email, phone: $phone, linkedin: $linkedin, github: $github, twitter: $twitter, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.linkedin, linkedin) ||
                other.linkedin == linkedin) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    phone,
    linkedin,
    github,
    twitter,
    location,
  );

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoImplToJson(this);
  }
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo({
    required final String email,
    required final String phone,
    required final String linkedin,
    required final String github,
    final String twitter,
    final String location,
  }) = _$ContactInfoImpl;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$ContactInfoImpl.fromJson;

  @override
  String get email;
  @override
  String get phone;
  @override
  String get linkedin;
  @override
  String get github;
  @override
  String get twitter;
  @override
  String get location;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
