import 'package:chronoplay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final text = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.howToPlayTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎴 CORE RULES
            Text(
              l10n.howToPlayCoreRules,
              style: text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),

            _StepRow(
              icon: Icons.style_outlined,
              label: l10n.ruleStartCard,
            ),
            const SizedBox(height: 20),

            _StepRow(
              icon: Icons.qr_code_scanner_outlined,
              label: l10n.ruleScanCard,
            ),
            const SizedBox(height: 20),

            _StepRow(
              icon: Icons.phone_android_outlined,
              label: l10n.ruleFaceDown,
            ),
            const SizedBox(height: 20),

            _StepRow(
              icon: Icons.headphones_outlined,
              label: l10n.ruleListen,
            ),
            const SizedBox(height: 20),

            _StepRow(
              icon: Icons.timeline_outlined,
              label: l10n.ruleTimeline,
            ),
            const SizedBox(height: 20),

            _StepRow(
              icon: Icons.visibility_outlined,
              label: l10n.ruleReveal,
            ),
            const SizedBox(height: 20),

            _StepRow(
              icon: Icons.emoji_events_outlined,
              label: l10n.ruleWin,
            ),

            const SizedBox(height: 40),

            // 🪙 TOKENS SECTION
            Text(
              l10n.howToPlayOptionalTokens,
              style: text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              l10n.tokensIntro,
              style: text.bodyMedium,
            ),
            const SizedBox(height: 24),

            _StepRow(
              icon: Icons.skip_next_outlined,
              label: l10n.tokenSkip,
            ),
            const SizedBox(height: 16),

            _StepRow(
              icon: Icons.gavel_outlined,
              label: l10n.tokenSteal,
            ),
            const SizedBox(height: 16),

            _StepRow(
              icon: Icons.swap_horiz_outlined,
              label: l10n.tokenTrade,
            ),
            const SizedBox(height: 24),

            _StepRow(
              icon: Icons.star_outline,
              label: l10n.tokenEarn,
            ),

            const SizedBox(height: 32),

            Center(
              child: Text(
                l10n.howToPlayTagline,
                style: text.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StepRow({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
