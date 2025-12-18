import 'package:chronoplay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'scanner_screen.dart';
import 'face_down_screen.dart';
import 'player_screen.dart';
import 'how_to_play_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(0.35),
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.style_outlined, size: 48, color: theme.colorScheme.primary),
                const SizedBox(height: 24),

                Text(
                  l10n.homeReadyTitle,
                  style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                Text(
                  l10n.homeSubtitle,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final videoId = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(builder: (_) => const ScannerScreen()),
                      );

                      if (videoId == null) return;

                      final ready = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(builder: (_) => const FaceDownScreen()),
                      );

                      if (ready != true) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlayerScreen(videoId: videoId),
                        ),
                      );
                    },
                    child: Text(l10n.homeStartGame),
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HowToPlayScreen()),
                      );
                    },
                    child: Text(l10n.homeHowToPlay),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
