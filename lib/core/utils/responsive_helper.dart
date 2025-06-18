import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;
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

  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 40);
    }
    if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 60);
    }
    return const EdgeInsets.symmetric(horizontal: 80, vertical: 80);
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 4;
  }
}