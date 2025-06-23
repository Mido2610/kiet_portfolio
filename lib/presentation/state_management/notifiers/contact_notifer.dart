import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/core/services/email_service.dart';
import 'package:kiet_portfolio/presentation/state_management/state/contact_state.dart';

class ContactNotifier extends StateNotifier<ContactState> {
  ContactNotifier() : super(const ContactState());

  Future<void> sendContactEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    try {
      final bool success = await EmailService.sendContactEmail(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );

      if (success) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to send email. Please try again.',
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: 'Error: $e');
    }
  }

  void resetState() {
    state = const ContactState();
  }
}