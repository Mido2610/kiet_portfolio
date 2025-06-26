import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @initializingPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Initializing Portfolio...'**
  String get initializingPortfolio;

  /// No description provided for @failedToInitializeApp.
  ///
  /// In en, this message translates to:
  /// **'Failed to Initialize App'**
  String get failedToInitializeApp;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @hiThereIm.
  ///
  /// In en, this message translates to:
  /// **'Hi there! 👋 I\'m'**
  String get hiThereIm;

  /// No description provided for @kietNguyen.
  ///
  /// In en, this message translates to:
  /// **'Nguyen Tuan Kiet'**
  String get kietNguyen;

  /// No description provided for @flutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get flutterDeveloper;

  /// No description provided for @mobileAppDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Developer'**
  String get mobileAppDeveloper;

  /// No description provided for @frontEndDeveloper.
  ///
  /// In en, this message translates to:
  /// **'FrontEnd Developer'**
  String get frontEndDeveloper;

  /// No description provided for @uiUxEnthusiast.
  ///
  /// In en, this message translates to:
  /// **'UI/UX Enthusiast'**
  String get uiUxEnthusiast;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'I craft responsive web interfaces using React and build cross-platform mobile apps with Flutter.'**
  String get heroDescription;

  /// No description provided for @viewMyWork.
  ///
  /// In en, this message translates to:
  /// **'View My Work'**
  String get viewMyWork;

  /// No description provided for @contactMe.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contactMe;

  /// No description provided for @github.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get github;

  /// No description provided for @linkedin.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedin;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @passionateFlutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Passionate Flutter Developer'**
  String get passionateFlutterDeveloper;

  /// No description provided for @aboutDescription1.
  ///
  /// In en, this message translates to:
  /// **'I\'m a dedicated Flutter developer with over 3 years of experience creating beautiful, performant mobile applications. My journey started with a fascination for clean code and pixel-perfect designs, and has evolved into a passion for building user-centric digital experiences.'**
  String get aboutDescription1;

  /// No description provided for @aboutDescription2.
  ///
  /// In en, this message translates to:
  /// **'I specialize in cross-platform mobile development, state management, and creating seamless user interfaces. When I\'m not coding, you\'ll find me exploring new technologies, contributing to open-source projects, or sharing knowledge with the developer community.'**
  String get aboutDescription2;

  /// No description provided for @yearsExperience.
  ///
  /// In en, this message translates to:
  /// **'1+ Years'**
  String get yearsExperience;

  /// No description provided for @experienceLabel.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceLabel;

  /// No description provided for @technologiesCount.
  ///
  /// In en, this message translates to:
  /// **'10+'**
  String get technologiesCount;

  /// No description provided for @technologies.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get technologies;

  /// No description provided for @whatIDooBest.
  ///
  /// In en, this message translates to:
  /// **'What I Do Best'**
  String get whatIDooBest;

  /// No description provided for @crossPlatformDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Cross-Platform Development'**
  String get crossPlatformDevelopment;

  /// No description provided for @performanceOptimization.
  ///
  /// In en, this message translates to:
  /// **'Performance Optimization'**
  String get performanceOptimization;

  /// No description provided for @uiUxImplementation.
  ///
  /// In en, this message translates to:
  /// **'UI/UX Implementation'**
  String get uiUxImplementation;

  /// No description provided for @backendIntegration.
  ///
  /// In en, this message translates to:
  /// **'Backend Integration'**
  String get backendIntegration;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @locationValue.
  ///
  /// In en, this message translates to:
  /// **'Ho Chi Minh City, Vietnam'**
  String get locationValue;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @languagesValue.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese, English'**
  String get languagesValue;

  /// No description provided for @interests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get interests;

  /// No description provided for @interestsValue.
  ///
  /// In en, this message translates to:
  /// **'Technology, Design, Travel'**
  String get interestsValue;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @statusValue.
  ///
  /// In en, this message translates to:
  /// **'Available for Freelance'**
  String get statusValue;

  /// No description provided for @technologiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get technologiesTitle;

  /// No description provided for @skillsDescription.
  ///
  /// In en, this message translates to:
  /// **'Here are the technologies and tools which I regularly work with.'**
  String get skillsDescription;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @sendMeAMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Me a Message'**
  String get sendMeAMessage;

  /// No description provided for @messageDescription.
  ///
  /// In en, this message translates to:
  /// **'Have a question or want to work together? Send me a message and I\'ll get back to you as soon as possible.'**
  String get messageDescription;

  /// No description provided for @getInTouch.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get getInTouch;

  /// No description provided for @contactDescription.
  ///
  /// In en, this message translates to:
  /// **'I\'m always open to discussing new opportunities and interesting projects. Feel free to reach out!'**
  String get contactDescription;

  /// No description provided for @contactMeButton.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contactMeButton;

  /// No description provided for @englishLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @vietnameseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get vietnameseLanguage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
