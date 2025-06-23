// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactStateImpl _$$ContactStateImplFromJson(Map<String, dynamic> json) =>
    _$ContactStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
      isSuccess: json['isSuccess'] as bool? ?? false,
      isInitialized: json['isInitialized'] as bool? ?? false,
    );

Map<String, dynamic> _$$ContactStateImplToJson(_$ContactStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
      'isSuccess': instance.isSuccess,
      'isInitialized': instance.isInitialized,
    };
