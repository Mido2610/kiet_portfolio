import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/themes/app_theme.dart';
import 'core/providers/core_provider.dart';
import 'presentation/pages/portfolio_home_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch app initialization
    final appInitialization = ref.watch(appInitializationProvider);

    return appInitialization.when(
      // App đã initialize thành công
      data: (_) => const _InitializedApp(),

      // Đang initialize
      loading:
          () => MaterialApp(
            title: 'Kiet Nguyen Portfolio',
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            home: const Scaffold(
              backgroundColor: Color(0xFF0A0A0A),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF00D9FF),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Initializing Portfolio...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

      // Lỗi khi initialize
      error:
          (error, stackTrace) => MaterialApp(
            title: 'Kiet Nguyen Portfolio',
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: const Color(0xFF0A0A0A),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Failed to Initialize App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error: $error',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Retry initialization
                          ref.invalidate(appInitializationProvider);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D9FF),
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

class _InitializedApp extends ConsumerWidget {
  const _InitializedApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Kiet Nguyen Portfolio',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: const PortfolioHomePage(),
    );
  }
}