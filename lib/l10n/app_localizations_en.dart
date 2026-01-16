// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ChronoPlay';

  @override
  String get homeReadyTitle => 'Ready to play?';

  @override
  String get homeSubtitle => 'Scan a card, place your phone face down,\nand listen carefully.';

  @override
  String get homeStartGame => 'Start game';

  @override
  String get homeHowToPlay => 'How to play';

  @override
  String get faceDownTitle => 'Get ready';

  @override
  String get faceDownInstruction => 'Place the phone face down';

  @override
  String get faceDownSubtitle => 'The music will start automatically';

  @override
  String get howToPlayTitle => 'How to Play';

  @override
  String get howToPlayCoreRules => 'Core rules';

  @override
  String get howToPlayOptionalTokens => 'Optional: Tokens';

  @override
  String get howToPlayTagline => 'Build your musical timeline and relive the moments.';

  @override
  String get ruleStartCard => 'Each player starts with one music card placed in front of them.';

  @override
  String get ruleScanCard => 'Scan a new card\nPoint your camera at the QR code to start the song.';

  @override
  String get ruleFaceDown => 'Place the phone face down\nThe music will start automatically.';

  @override
  String get ruleListen => 'Listen carefully\nNo peeking at the title or year.';

  @override
  String get ruleTimeline => 'Place the card on your timeline\nDecide whether it belongs before, after, or between your existing cards.';

  @override
  String get ruleReveal => 'Flip the card to reveal the year\nIf you placed it correctly, keep the card.';

  @override
  String get ruleWin => 'The first player to reach 10 cards wins the game.';

  @override
  String get tokensIntro => 'For a more strategic game, players may use tokens.';

  @override
  String get tokenSkip => 'On your turn:\nSpend 1 token to skip the current song and draw a new card.';

  @override
  String get tokenSteal => 'On an opponent’s turn:\nPlace a token on their timeline if you think a card was placed incorrectly.\nIf you’re right, steal the card.';

  @override
  String get tokenTrade => 'Anytime:\nTrade 3 tokens for a card from the deck and place it directly on your timeline.';

  @override
  String get tokenEarn => 'Earning tokens:\nCorrectly name the song and artist to earn 1 token, even if the card was misplaced.\nMaximum: 5 tokens per player.';

  @override
  String get playerListening => 'Listening';

  @override
  String get playerNextCard => 'Next card';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsDurationLabel => 'Playback duration';

  @override
  String get settingsNoLimit => 'Full song';

  @override
  String get settingsStartAt => 'Start playback at';

  @override
  String get settingsExperimental => 'Experimental';

  @override
  String get settingsBackTapTitle => 'Double tap to pause';

  @override
  String get settingsBackTapDescription => 'Pause or resume the music by tapping twice on the back of your phone while it is face down. This feature may not work consistently on all devices.';

  @override
  String get scannerTitle => 'Scan card';
}
