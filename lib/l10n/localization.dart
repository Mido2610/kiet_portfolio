import 'package:flutter/material.dart';
import 'package:kiet_portfolio/gen/l10n/app_localizations.dart';

class Localization {
  static Localization? _instance;
  static Localization get instance => _instance ??= Localization._();
  Localization._();

  static AppLocalizations? _l;

  AppLocalizations get l {
    if (_l == null) {
      throw Exception('Localization.init(context) must be called before accessing l.');
    }
    return _l!;
  }

  void init(BuildContext context) {
    final newL = AppLocalizations.of(context);
    if (_l?.localeName != newL?.localeName) {
      _l = newL;
    }
  }

  // Thêm method để force refresh
  void refresh(BuildContext context) {
    _l = AppLocalizations.of(context);
  }
}