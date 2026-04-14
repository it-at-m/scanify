import 'package:flutter/material.dart';
import 'package:flutter_application/core/navigation/navigation_cubit.dart';
import 'package:flutter_application/features/scan/bloc/scan_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:flutter_application/features/home/views/home_page.dart';
import 'package:flutter_application/features/scan/views/scan_page.dart';
import 'package:flutter_application/features/history/views/history_page.dart';
import 'package:flutter_application/features/export/views/export_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  static const _pages = <Widget>[
    HomePage(),
    ScanPage(),
    HistoryPage(),
    ExportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final scan = context.read<ScanCubit>();

    return BlocConsumer<NavigationCubit, AppTab>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, tab) async {
        await Haptics.vibrate(HapticsType.selection);

        if (tab == AppTab.scan) {
          await scan.start();
          await WakelockPlus.enable();
        } else {
          await scan.stop();
          await WakelockPlus.disable();
        }
      },
      builder: (context, tab) {
        return Scaffold(
          body: IndexedStack(index: tab.index, children: _pages),
          bottomNavigationBar: NavigationBar(
            selectedIndex: tab.index,
            onDestinationSelected: (i) =>
                context.read<NavigationCubit>().setIndex(i),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.document_scanner_outlined),
                selectedIcon: Icon(Icons.document_scanner),
                label: 'Scan',
              ),
              NavigationDestination(
                icon: Icon(Icons.access_time),
                selectedIcon: Icon(Icons.access_time_filled),
                label: 'History',
              ),
              NavigationDestination(
                icon: Icon(Icons.share_outlined),
                selectedIcon: Icon(Icons.share),
                label: 'Export',
              ),
            ],
          ),
        );
      },
    );
  }
}
