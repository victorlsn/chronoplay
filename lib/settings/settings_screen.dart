import 'package:flutter/material.dart';
import 'package:chronoplay/l10n/app_localizations.dart';
import '../settings/app_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int? playDuration;
  int startAt = 45;
  bool backTapEnabled = true;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    playDuration = await AppSettings.getPlayDuration();
    startAt = await AppSettings.getStartAt();
    backTapEnabled = await AppSettings.isBackTapEnabled();

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────
            // Playback duration
            // ─────────────
            Text(
              l10n.settingsDurationLabel,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),

            Slider(
              min: 15,
              max: 90,
              divisions: 5,
              value: (playDuration ?? 90).toDouble(),
              label: playDuration == null
                  ? l10n.settingsNoLimit
                  : '${playDuration}s',
              onChanged: (value) {
                setState(() {
                  playDuration = value >= 90 ? null : value.toInt();
                });
              },
              onChangeEnd: (_) {
                AppSettings.setPlayDuration(playDuration);
              },
            ),

            const SizedBox(height: 32),

            // ─────────────
            // Start at
            // ─────────────
            Text(
              l10n.settingsStartAt,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),

            Slider(
              min: 0,
              max: 90,
              divisions: 9,
              value: startAt.toDouble(),
              label: '${startAt}s',
              onChanged: (value) {
                setState(() {
                  startAt = value.toInt();
                });
              },
              onChangeEnd: (_) {
                AppSettings.setStartAt(startAt);
              },
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 24),

            // ─────────────
            // Experimental: Back tap
            // ─────────────
            Text(
              l10n.settingsExperimental,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.settingsBackTapTitle),
              value: backTapEnabled,
              onChanged: (value) {
                setState(() => backTapEnabled = value);
                AppSettings.setBackTapEnabled(value);
              },
            ),

            const SizedBox(height: 8),

            Text(
              l10n.settingsBackTapDescription,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
