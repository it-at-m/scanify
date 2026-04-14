import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/card_widget.dart';
import 'package:flutter_application/features/home/views/onboarding_export_page.dart';
import 'package:flutter_application/features/home/views/onboarding_general_page.dart';
import 'package:flutter_application/features/home/views/onboarding_history_page.dart';
import 'package:flutter_application/features/home/views/onboarding_scan_page.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            title: Text('Onboarding'),
            subtitle: Text('Learn how to use the app.'),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('1 · General information'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const OnboardingGeneralPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('2 · Scan + options'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const OnboardingScanOptionsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('3 · History + groups'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const OnboardingHistoryGroupsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('4 · Export'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OnboardingExportPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
