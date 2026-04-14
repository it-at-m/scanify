import 'package:flutter/material.dart';

class OnboardingExportPage extends StatelessWidget {
  const OnboardingExportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final bodyStyle = theme.textTheme.bodyMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('4 · Export')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Export groups', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'Multiple groups can be selected for export. The export can be shared or saved via the "Share Export" button',
              style: bodyStyle,
            ),
            const Divider(height: 32),

            Text('Available export formats', style: headerStyle),
            const SizedBox(height: 8),
            SelectableText(
              'Groups can be exported as CSV, Text and JSON.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
