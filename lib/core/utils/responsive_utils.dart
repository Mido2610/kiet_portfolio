import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }

  static EdgeInsets getSectionPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 60);
    }
    if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 80);
    }
    return const EdgeInsets.symmetric(horizontal: 80, vertical: 100);
  }

  static EdgeInsets getCardPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    }
    return const EdgeInsets.all(24);
  }

  static double getCardSpacing(BuildContext context) {
    if (isMobile(context)) return 16;
    if (isTablet(context)) return 20;
    return 24;
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  static double getGridChildAspectRatio(BuildContext context) {
    if (isMobile(context)) return 0.8;
    if (isTablet(context)) return 0.85;
    return 0.9;
  }
}