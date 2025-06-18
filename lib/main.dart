import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/themes/app_theme.dart';
import 'presentation/pages/portfolio_home_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiet Nguyen Portfolio',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const PortfolioHomePage(),
    );
  }
}