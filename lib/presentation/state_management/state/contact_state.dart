import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';
part 'contact_state.g.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState({
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSuccess,

    // App State & Lifecycle
    @Default(false) bool isInitialized,
  }) = _ContactState;

  factory ContactState.fromJson(Map<String, dynamic> json) =>
      _$ContactStateFromJson(json);
}
