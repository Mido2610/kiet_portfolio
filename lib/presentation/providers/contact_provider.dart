import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/presentation/state_management/notifiers/contact_notifer.dart';
import 'package:kiet_portfolio/presentation/state_management/state/contact_state.dart';

final contactProvider = StateNotifierProvider<ContactNotifier, ContactState>((
  ref,
) {
  return ContactNotifier();
});