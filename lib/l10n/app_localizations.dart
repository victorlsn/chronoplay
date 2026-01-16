import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

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
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ChronoPlay'**
  String get appTitle;

  /// No description provided for @homeReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to play?'**
  String get homeReadyTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Scan a card, place your phone face down,\nand listen carefully.'**
  String get homeSubtitle;

  /// No description provided for @homeStartGame.
  ///
  /// In en, this message translates to:
  /// **'Start game'**
  String get homeStartGame;

  /// No description provided for @homeHowToPlay.
  ///
  /// In en, this message translates to:
  /// **'How to play'**
  String get homeHowToPlay;

  /// No description provided for @faceDownTitle.
  ///
  /// In en, this message translates to:
  /// **'Get ready'**
  String get faceDownTitle;

  /// No description provided for @faceDownInstruction.
  ///
  /// In en, this message translates to:
  /// **'Place the phone face down'**
  String get faceDownInstruction;

  /// No description provided for @faceDownSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The music will start automatically'**
  String get faceDownSubtitle;

  /// No description provided for @howToPlayTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Play'**
  String get howToPlayTitle;

  /// No description provided for @howToPlayCoreRules.
  ///
  /// In en, this message translates to:
  /// **'Core rules'**
  String get howToPlayCoreRules;

  /// No description provided for @howToPlayOptionalTokens.
  ///
  /// In en, this message translates to:
  /// **'Optional: Tokens'**
  String get howToPlayOptionalTokens;

  /// No description provided for @howToPlayTagline.
  ///
  /// In en, this message translates to:
  /// **'Build your musical timeline and relive the moments.'**
  String get howToPlayTagline;

  /// No description provided for @ruleStartCard.
  ///
  /// In en, this message translates to:
  /// **'Each player starts with one music card placed in front of them.'**
  String get ruleStartCard;

  /// No description provided for @ruleScanCard.
  ///
  /// In en, this message translates to:
  /// **'Scan a new card\nPoint your camera at the QR code to start the song.'**
  String get ruleScanCard;

  /// No description provided for @ruleFaceDown.
  ///
  /// In en, this message translates to:
  /// **'Place the phone face down\nThe music will start automatically.'**
  String get ruleFaceDown;

  /// No description provided for @ruleListen.
  ///
  /// In en, this message translates to:
  /// **'Listen carefully\nNo peeking at the title or year.'**
  String get ruleListen;

  /// No description provided for @ruleTimeline.
  ///
  /// In en, this message translates to:
  /// **'Place the card on your timeline\nDecide whether it belongs before, after, or between your existing cards.'**
  String get ruleTimeline;

  /// No description provided for @ruleReveal.
  ///
  /// In en, this message translates to:
  /// **'Flip the card to reveal the year\nIf you placed it correctly, keep the card.'**
  String get ruleReveal;

  /// No description provided for @ruleWin.
  ///
  /// In en, this message translates to:
  /// **'The first player to reach 10 cards wins the game.'**
  String get ruleWin;

  /// No description provided for @tokensIntro.
  ///
  /// In en, this message translates to:
  /// **'For a more strategic game, players may use tokens.'**
  String get tokensIntro;

  /// No description provided for @tokenSkip.
  ///
  /// In en, this message translates to:
  /// **'On your turn:\nSpend 1 token to skip the current song and draw a new card.'**
  String get tokenSkip;

  /// No description provided for @tokenSteal.
  ///
  /// In en, this message translates to:
  /// **'On an opponent’s turn:\nPlace a token on their timeline if you think a card was placed incorrectly.\nIf you’re right, steal the card.'**
  String get tokenSteal;

  /// No description provided for @tokenTrade.
  ///
  /// In en, this message translates to:
  /// **'Anytime:\nTrade 3 tokens for a card from the deck and place it directly on your timeline.'**
  String get tokenTrade;

  /// No description provided for @tokenEarn.
  ///
  /// In en, this message translates to:
  /// **'Earning tokens:\nCorrectly name the song and artist to earn 1 token, even if the card was misplaced.\nMaximum: 5 tokens per player.'**
  String get tokenEarn;

  /// No description provided for @playerListening.
  ///
  /// In en, this message translates to:
  /// **'Listening'**
  String get playerListening;

  /// No description provided for @playerNextCard.
  ///
  /// In en, this message translates to:
  /// **'Next card'**
  String get playerNextCard;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Playback duration'**
  String get settingsDurationLabel;

  /// No description provided for @settingsNoLimit.
  ///
  /// In en, this message translates to:
  /// **'Full song'**
  String get settingsNoLimit;

  /// No description provided for @settingsStartAt.
  ///
  /// In en, this message translates to:
  /// **'Start playback at'**
  String get settingsStartAt;

  /// No description provided for @settingsExperimental.
  ///
  /// In en, this message translates to:
  /// **'Experimental'**
  String get settingsExperimental;

  /// No description provided for @settingsBackTapTitle.
  ///
  /// In en, this message translates to:
  /// **'Double tap to pause'**
  String get settingsBackTapTitle;

  /// No description provided for @settingsBackTapDescription.
  ///
  /// In en, this message translates to:
  /// **'Pause or resume the music by tapping twice on the back of your phone while it is face down. This feature may not work consistently on all devices.'**
  String get settingsBackTapDescription;

  /// No description provided for @scannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan card'**
  String get scannerTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
