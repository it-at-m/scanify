import 'package:flutter/material.dart';

class OnboardingGeneralPage extends StatelessWidget {
  const OnboardingGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final bodyStyle = theme.textTheme.bodyMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('1 · General information')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'The Scanify flutter application is a powerful camera based scanner for all common QR and barcode formats. Scanify is originally developed by a student as a project at Hof Universtiy (Hochschule Hof). Camera permission is required for full functionallity.',
              style: bodyStyle,
            ),
            const Divider(height: 32),

            Text('Contact', style: headerStyle),
            const SizedBox(height: 8),
            SelectableText('E-Mail: apps@muenchen.de', style: bodyStyle),
            const Divider(height: 32),

            Text('Used Libraries', style: headerStyle),
            const SizedBox(height: 8),
            Text(
              'This application uses open source software. You can view all licenses and copyright information below.',
              style: bodyStyle,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'Scanify',
                    applicationVersion: '1.0.0',
                  );
                },
                child: const Text('View all Licenses'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
