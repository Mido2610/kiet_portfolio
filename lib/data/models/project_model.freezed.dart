// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

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
  ProjectCategory get category => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  List<String> get screenshots => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get projectDuration => throw _privateConstructorUsedError;
  List<String> get keyFeatures => throw _privateConstructorUsedError;
  String get longDescription => throw _privateConstructorUsedError;

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
    ProjectCategory category,
    bool isFeatured,
    String videoUrl,
    List<String> screenshots,
    String clientName,
    String projectDuration,
    List<String> keyFeatures,
    String longDescription,
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
    Object? screenshots = null,
    Object? clientName = null,
    Object? projectDuration = null,
    Object? keyFeatures = null,
    Object? longDescription = null,
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
                        as ProjectCategory,
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
            screenshots:
                null == screenshots
                    ? _value.screenshots
                    : screenshots // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            clientName:
                null == clientName
                    ? _value.clientName
                    : clientName // ignore: cast_nullable_to_non_nullable
                        as String,
            projectDuration:
                null == projectDuration
                    ? _value.projectDuration
                    : projectDuration // ignore: cast_nullable_to_non_nullable
                        as String,
            keyFeatures:
                null == keyFeatures
                    ? _value.keyFeatures
                    : keyFeatures // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            longDescription:
                null == longDescription
                    ? _value.longDescription
                    : longDescription // ignore: cast_nullable_to_non_nullable
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
    ProjectCategory category,
    bool isFeatured,
    String videoUrl,
    List<String> screenshots,
    String clientName,
    String projectDuration,
    List<String> keyFeatures,
    String longDescription,
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
    Object? screenshots = null,
    Object? clientName = null,
    Object? projectDuration = null,
    Object? keyFeatures = null,
    Object? longDescription = null,
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
                    as ProjectCategory,
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
        screenshots:
            null == screenshots
                ? _value._screenshots
                : screenshots // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        clientName:
            null == clientName
                ? _value.clientName
                : clientName // ignore: cast_nullable_to_non_nullable
                    as String,
        projectDuration:
            null == projectDuration
                ? _value.projectDuration
                : projectDuration // ignore: cast_nullable_to_non_nullable
                    as String,
        keyFeatures:
            null == keyFeatures
                ? _value._keyFeatures
                : keyFeatures // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        longDescription:
            null == longDescription
                ? _value.longDescription
                : longDescription // ignore: cast_nullable_to_non_nullable
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
    final List<String> screenshots = const [],
    this.clientName = '',
    this.projectDuration = '',
    final List<String> keyFeatures = const [],
    this.longDescription = '',
  }) : _technologies = technologies,
       _screenshots = screenshots,
       _keyFeatures = keyFeatures;

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
  final ProjectCategory category;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final String videoUrl;
  final List<String> _screenshots;
  @override
  @JsonKey()
  List<String> get screenshots {
    if (_screenshots is EqualUnmodifiableListView) return _screenshots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_screenshots);
  }

  @override
  @JsonKey()
  final String clientName;
  @override
  @JsonKey()
  final String projectDuration;
  final List<String> _keyFeatures;
  @override
  @JsonKey()
  List<String> get keyFeatures {
    if (_keyFeatures is EqualUnmodifiableListView) return _keyFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyFeatures);
  }

  @override
  @JsonKey()
  final String longDescription;

  @override
  String toString() {
    return 'Project(id: $id, title: $title, description: $description, imageUrl: $imageUrl, technologies: $technologies, githubUrl: $githubUrl, liveUrl: $liveUrl, category: $category, isFeatured: $isFeatured, videoUrl: $videoUrl, screenshots: $screenshots, clientName: $clientName, projectDuration: $projectDuration, keyFeatures: $keyFeatures, longDescription: $longDescription)';
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
                other.videoUrl == videoUrl) &&
            const DeepCollectionEquality().equals(
              other._screenshots,
              _screenshots,
            ) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.projectDuration, projectDuration) ||
                other.projectDuration == projectDuration) &&
            const DeepCollectionEquality().equals(
              other._keyFeatures,
              _keyFeatures,
            ) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription));
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
    const DeepCollectionEquality().hash(_screenshots),
    clientName,
    projectDuration,
    const DeepCollectionEquality().hash(_keyFeatures),
    longDescription,
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
    required final ProjectCategory category,
    final bool isFeatured,
    final String videoUrl,
    final List<String> screenshots,
    final String clientName,
    final String projectDuration,
    final List<String> keyFeatures,
    final String longDescription,
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
  ProjectCategory get category;
  @override
  bool get isFeatured;
  @override
  String get videoUrl;
  @override
  List<String> get screenshots;
  @override
  String get clientName;
  @override
  String get projectDuration;
  @override
  List<String> get keyFeatures;
  @override
  String get longDescription;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
