import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static const _playDurationKey = 'play_duration_seconds';
  static const _startAtKey = 'start_at_seconds';
  static const _backTapEnabledKey = 'backTapEnabled';

  /// Loaders
  static Future<int?> getPlayDuration() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_playDurationKey);
  }

  static Future<int> getStartAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_startAtKey) ?? 0;
  }

  static Future<bool> isBackTapEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_backTapEnabledKey) ?? false; // ligado por padrão
  }

  /// Savers
  static Future<void> setPlayDuration(int? seconds) async {
    final prefs = await SharedPreferences.getInstance();

    if (seconds == null) {
      await prefs.remove(_playDurationKey);
    } else {
      await prefs.setInt(_playDurationKey, seconds);
    }
  }

  static Future<void> setStartAt(int seconds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_startAtKey, seconds);
  }

  static Future<void> setBackTapEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_backTapEnabledKey, value);
  }
}
