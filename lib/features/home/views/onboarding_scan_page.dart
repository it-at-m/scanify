import 'package:flutter/material.dart';

class OnboardingScanOptionsPage extends StatelessWidget {
  const OnboardingScanOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final bodyStyle = theme.textTheme.bodyMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('2 · Scan + options')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scan insight', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'In the scan tab that is reached via the bottom navigation bar (outside of this onboarding) you will see the live camera preview. This app uses a camera/picture based approach to scan different kinds of QR and barcode formats. There are multiple options for the scan, reachable via the action button on the bottom right corner.\n'
              '• Select format\n'
              '• Select focus\n'
              '• Select groups\n'
              '• Toggle flashlight',
              style: bodyStyle,
            ),
            const Divider(height: 32),

            Text('Available code formats', style: headerStyle),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            SelectableText(
              '• qrCode\n'
              '• code128\n'
              '• ean13\n'
              '• ean8\n'
              '• pdf417\n'
              '• dataMatrix\n'
              '• aztec\n'
              '• codabar\n'
              '• code93\n'
              '• itf\n'
              '• upcA\n'
              '• upcE',
              style: bodyStyle,
            ),
            const Divider(height: 32),

            Text('Troubleshooting', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'These are the most common issues if the code is not recognized:\n'
              '• Too dark environment\n(Recommendation: Toggle flashlight)\n'
              '• Bad focus\n(Recommendation: Clean camera)\n'
              '• Unknown code format\n(Recommendation: Make sure format is supported)',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
