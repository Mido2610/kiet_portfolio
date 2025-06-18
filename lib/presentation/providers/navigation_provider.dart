import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void navigateToSection(int index) {
    state = index;
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, int>(
  (ref) => NavigationNotifier(),
);

final navigationController = Provider<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(() => controller.dispose());
  return controller;
});