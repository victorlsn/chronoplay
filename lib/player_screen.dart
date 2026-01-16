import 'dart:async';

import 'package:chronoplay/l10n/app_localizations.dart';
import 'package:chronoplay/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'scanner_screen.dart';
import 'face_down_screen.dart';

class PlayerScreen extends StatefulWidget {
  final String videoId;
  const PlayerScreen({super.key, required this.videoId});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  YoutubePlayerController? controller;

  Timer? stopTimer;
  StreamSubscription<AccelerometerEvent>? accelSub;

  bool isPaused = false;
  String? videoTitle;

  int? playDuration;
  int startAt = 45;

  DateTime? playbackStartedAt;

  static const double knockDelta = 2;
  static const double faceDownZ = -6.5;

  double? lastZ;
  double? lastY;
  double? lastX;

  DateTime? firstKnockAt;
  DateTime? lastActionAt;

  static const int minTapIntervalMs = 150;
  static const int maxTapIntervalMs = 650;
  static const int globalDebounceMs = 1200;

  int knockSpikeCount = 0;
  DateTime? firstSpikeAt;
  DateTime? lastKnockAt;

  // ────────────────────────

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    playDuration = await AppSettings.getPlayDuration();
    startAt = await AppSettings.getStartAt();

    final yt = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        hideControls: true,
        disableDragSeek: true,
        enableCaption: false,
      ),
    )..addListener(_onPlayerUpdate);

    setState(() => controller = yt);
  }

  void _onPlayerUpdate() {
    final title = controller?.metadata.title ?? '';
    if (title.isNotEmpty && title != videoTitle) {
      setState(() => videoTitle = title);
    }
  }

  // ────────────────────────
  // YouTube ready
  // ────────────────────────
  Future<void> _onYoutubeReady() async {
    controller!.seekTo(Duration(seconds: startAt));
    controller!.play();

    playbackStartedAt = DateTime.now();
    isPaused = false;

    final enabled = await AppSettings.isBackTapEnabled();
    if (enabled) {
      _startBackTapDetection();
    }
    _scheduleStopTimer();
  }

  // ────────────────────────
  // Playback duration logic
  // ────────────────────────
  void _scheduleStopTimer() {
    stopTimer?.cancel();

    if (playDuration == null) return;

    stopTimer = Timer(Duration(seconds: playDuration!), _autoPause);
  }

  void _autoPause() {
    controller?.pause();
    stopTimer?.cancel();

    setState(() => isPaused = true);
  }

  // ────────────────────────
  // Toggle playback
  // ────────────────────────
  void _togglePlayback({bool fromBackTap = false}) {
    if (controller == null) return;

    if (controller!.value.isPlaying) {
      controller!.pause();
      stopTimer?.cancel();
      setState(() => isPaused = true);
      return;
    }

    controller!.play();
    setState(() => isPaused = false);

    if (playDuration != null && playbackStartedAt != null) {
      final elapsed = DateTime.now().difference(playbackStartedAt!).inSeconds;
      final remaining = playDuration! - elapsed;

      if (remaining <= 0) {
        _autoPause();
        return;
      }

      stopTimer = Timer(Duration(seconds: remaining), _autoPause);
    }
  }

  // ────────────────────────
  // Back-tap detection
  // ────────────────────────
  void _startBackTapDetection() {
    accelSub?.cancel();

    accelSub = accelerometerEvents.listen((event) {
      final now = DateTime.now();

      if (lastActionAt != null &&
          now.difference(lastActionAt!).inMilliseconds < globalDebounceMs) {
        lastZ = event.z;
        return;
      }

      if (event.z > faceDownZ) {
        _resetKnocks();
        lastZ = event.z;
        return;
      }

      if (lastZ == null) {
        lastZ = event.z;
        return;
      }

      final zDelta = (event.z - lastZ!).abs();
      lastZ = event.z;

      if (zDelta < knockDelta) return;

      if (firstKnockAt == null) {
        firstKnockAt = now;
        return;
      }

      final diff = now.difference(firstKnockAt!).inMilliseconds;

      if (diff < minTapIntervalMs) {
        return;
      }

      if (diff <= maxTapIntervalMs) {
        lastActionAt = now;
        _resetKnocks();
        _togglePlayback(fromBackTap: true);
      } else {
        firstKnockAt = now;
      }
    });
  }

  void _resetKnocks() {
    firstKnockAt = null;
  }

  void _stopBackTapDetection() {
    accelSub?.cancel();
    accelSub = null;
  }

  // ────────────────────────

  @override
  void dispose() {
    stopTimer?.cancel();
    _stopBackTapDetection();
    controller?.removeListener(_onPlayerUpdate);
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final videoSize = MediaQuery.of(context).size.width * 0.85;

    if (controller == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.playerListening)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.playerListening)),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: false,
          onReady: _onYoutubeReady,
        ),
        builder: (_, player) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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

                SizedBox(
                  width: videoSize,
                  height: videoSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: IgnorePointer(child: player),
                  ),
                ),

                const SizedBox(height: 24),

                IconButton(
                  icon: Icon(
                    isPaused ? Icons.play_arrow : Icons.pause,
                    size: 40,
                  ),
                  onPressed: _togglePlayback,
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: videoSize,
                  child: ElevatedButton(
                    onPressed: () async {
                      controller!.pause();
                      stopTimer?.cancel();
                      _stopBackTapDetection();

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
