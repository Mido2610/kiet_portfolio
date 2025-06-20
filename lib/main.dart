import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/themes/app_theme.dart';
import 'core/providers/core_provider.dart';
import 'presentation/pages/portfolio_home_page.dart';
import 'gen/l10n/app_localizations.dart';
import 'l10n/localization.dart';

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
      loading: () => MaterialApp(
        title: 'Kiet Nguyen Portfolio',
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
        ],
        home: Scaffold(
          backgroundColor: const Color(0xFF0A0A0A),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF00D9FF),
                  ),
                ),
                const SizedBox(height: 24),
                Builder(
                  builder: (context) {
                    // Khởi tạo localization trong Builder
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Localization().init(context);
                    });
                    return const Text(
                      'Initializing Portfolio...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // Lỗi khi initialize
      error: (error, stackTrace) => MaterialApp(
        title: 'Kiet Nguyen Portfolio',
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
        ],
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
                  Builder(
                    builder: (context) {
                      // Khởi tạo localization trong Builder
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Localization().init(context);
                      });
                      return const Text(
                        'Failed to Initialize App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
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
    final currentLocale = ref.watch(localeProvider);
    
    return MaterialApp(
      title: 'Kiet Nguyen Portfolio',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      locale: currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      builder: (context, child) {
        // Khởi tạo localization ngay khi MaterialApp được build
        Localization().init(context);
        return child!;
      },
      home: const PortfolioHomePage(),
    );
  }
}