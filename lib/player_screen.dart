import 'package:chronoplay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:chronoplay/face_down_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'scanner_screen.dart';

class PlayerScreen extends StatefulWidget {
  final String videoId;
  const PlayerScreen({super.key, required this.videoId});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late YoutubePlayerController controller;
  bool isPaused = false;
  String? videoTitle;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        hideControls: true,
        disableDragSeek: true,
        enableCaption: false,
        forceHD: false,
      ),
    )..addListener(_onPlayerUpdate);
  }

  void _onPlayerUpdate() {
    final title = controller.metadata.title;

    if (title.isNotEmpty && title != videoTitle) {
      setState(() {
        videoTitle = title;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onPlayerUpdate);
    controller.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    setState(() {
      isPaused = !isPaused;
      isPaused ? controller.pause() : controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final videoSize = screenWidth * 0.85;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.playerListening)),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: false,
        ),
        builder: (context, player) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),

                // 🎶 Video title (appears when metadata is ready)
                if (videoTitle != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      videoTitle!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // 🎵 Player (unchanged)
                SizedBox(
                  width: videoSize,
                  height: videoSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: IgnorePointer(child: player),
                  ),
                ),

                const SizedBox(height: 24),

                // ⏯ Pause / Resume button (unchanged placement)
                SizedBox(
                  width: videoSize,
                  child: IconButton(
                    icon: Icon(
                      isPaused ? Icons.play_arrow : Icons.pause,
                      size: 40,
                    ),
                    onPressed: _togglePlayback,
                  ),
                ),

                const SizedBox(height: 16),

                // ▶️ Next card button (unchanged)
                SizedBox(
                  width: videoSize,
                  child: ElevatedButton(
                    onPressed: () async {
                      controller.pause();

                      final nextVideoId = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ScannerScreen(),
                        ),
                      );

                      if (nextVideoId == null) return;

                      final ready = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FaceDownScreen(),
                        ),
                      );

                      if (ready != true) return;

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlayerScreen(videoId: nextVideoId),
                        ),
                      );
                    },
                    child: Text(l10n.playerNextCard),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
