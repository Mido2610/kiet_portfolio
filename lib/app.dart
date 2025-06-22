import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/l10n/localization.dart';
import 'core/themes/app_theme.dart';
import 'core/providers/core_provider.dart';
import 'presentation/pages/portfolio_home_page.dart';
import 'gen/l10n/app_localizations.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInitialization = ref.watch(appInitializationProvider);

    return appInitialization.when(
      data: (_) => const _InitializedApp(),
      loading: () => const _LoadingApp(),
      error:
          (error, stackTrace) => _ErrorApp(
            error: error,
            onRetry: () => ref.invalidate(appInitializationProvider),
          ),
    );
  }
}

class _LoadingApp extends StatelessWidget {
  const _LoadingApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiet Nguyen Portfolio',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: _localizationDelegates,
      supportedLocales: _supportedLocales,
      home: const _LoadingScreen(),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D9FF)),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ErrorApp extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorApp({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiet Nguyen Portfolio',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: _localizationDelegates,
      supportedLocales: _supportedLocales,
      home: _ErrorScreen(error: error, onRetry: onRetry),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorScreen({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D9FF),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text('Retry'),
              ),
            ],
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
    final currentLocale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Kiet Nguyen Portfolio',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      locale: currentLocale,
      localizationsDelegates: _localizationDelegates,
      supportedLocales: _supportedLocales,
      builder: (context, child) {
        if (child == null) {
          return const SizedBox.shrink();
        }
        // FORCE REFRESH localization khi locale thay đổi
        Localization.instance.init(context);

        return child;
      },
      home: const PortfolioHomePage(),
    );
  }
}

const List<LocalizationsDelegate> _localizationDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const List<Locale> _supportedLocales = [Locale('en'), Locale('vi')];