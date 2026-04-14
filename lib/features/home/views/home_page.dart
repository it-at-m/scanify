import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/widgets/onboarding_widget.dart';
import 'package:flutter_application/features/home/widgets/permissions_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: const [
          SizedBox(height: 6),
          OnboardingWidget(),
          PermissionsWidget(),
        ],
      ),
    );
  }
}
