import 'package:chronoplay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final l10n = AppLocalizations.of(context)!;

    final controller = MobileScannerController();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.scannerTitle)),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) async {
          final raw = capture.barcodes.first.rawValue;
          if (raw == null) return;

          final id = extractYouTubeVideoId(raw);
          if (id == null) return;

          await controller.stop();
          Navigator.pop(context, id);
        },
      ),
    );
  }

    String? extractYouTubeVideoId(String input) {
    if (input.startsWith('YT:')) {
      return input.substring(3);
    }
    return YoutubePlayer.convertUrlToId(input);
  }
}
