import 'package:flutter/material.dart';

class OnboardingHistoryGroupsPage extends StatelessWidget {
  const OnboardingHistoryGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final bodyStyle = theme.textTheme.bodyMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('3 · History + groups')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Automatic groups', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'Scans are automatically grouped by day. That are the groups you can find in History > Last.',
              style: bodyStyle,
            ),
            const Divider(height: 32),

            Text('Custom groups', style: headerStyle),
            const SizedBox(height: 8),
            SelectableText(
              'It is possible to create custom groups in the History view by expanding the bottom right menu, then creating it via the "+" button.',
              style: bodyStyle,
            ),
            const Divider(height: 32),

            Text('Select groups', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'All types of gorups can be selected via the folder button in the scan view. All scanned codes will get added to the selected groups but only if their requirements match.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
