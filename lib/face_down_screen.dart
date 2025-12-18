import 'dart:async';
import 'package:chronoplay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FaceDownScreen extends StatefulWidget {
  const FaceDownScreen({super.key});

  @override
  State<FaceDownScreen> createState() => _FaceDownScreenState();
}

class _FaceDownScreenState extends State<FaceDownScreen> {
  StreamSubscription<AccelerometerEvent>? sub;

  @override
  void initState() {
    super.initState();
    sub = accelerometerEvents.listen((event) {
      if (event.z < -7.5) {
        sub?.cancel();
        Navigator.pop(context, true);
      }
    });
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.faceDownTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone_android, size: 72, color: textTheme.bodyLarge?.color),
            const SizedBox(height: 24),
            Text(
              l10n.faceDownInstruction,
              style: textTheme.bodyLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.faceDownSubtitle,
              style: textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
