import 'package:flutter/material.dart';
import 'package:flutter_application/features/history/widgets/not_found_widget.dart';
import 'package:flutter_application/features/history/widgets/scan_element_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/history_state.dart';
import 'package:flutter_application/features/history/bloc/selection_cubit.dart';
import 'package:flutter_application/features/history/bloc/selection_state.dart';
import 'package:flutter_application/features/scan/models/scan_model.dart';

class ScanListWidget extends StatelessWidget {
  const ScanListWidget({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HistoryCubit, HistoryState, List<ScanModel>?>(
      selector: (state) {
        final group = state.groups[groupId];
        if (group == null) return null;

        final scans = group.scanIds
            .map((id) => state.scans[id])
            .whereType<ScanModel>()
            .toList();

        scans.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return scans;
      },
      builder: (context, scans) {
        if (scans == null) {
          return const NotFoundWidget(
            icon: Icons.error_outline,
            title: 'Group not found',
            subtitle: 'This group no longer exists.',
          );
        }

        if (scans.isEmpty) {
          return const NotFoundWidget(
            icon: Icons.qr_code_scanner,
            title: 'No scans yet',
            subtitle:
                'Select this group before the scan to see it listed here.',
          );
        }

        return BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, selection) {
            final enabled = selection.enabled;
            final selected = selection.selected;
            final history = context.read<HistoryCubit>();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: scans.length,
              itemBuilder: (context, index) {
                final s = scans[index];
                return ScanElementWidget(
                  scan: s,
                  selectionEnabled: enabled,
                  selected: selected.contains(s.id),
                  onSelectToggle: () {
                    final cubit = context.read<SelectionCubit>();
                    if (!cubit.state.enabled) cubit.toggleMode();
                    cubit.toggle(s.id);
                  },
                  onDelete: () => history.removeScanFromGroup(
                    groupId: groupId,
                    scanId: s.id,
                  ),
                  dismissibleKey: ValueKey(s.id),
                );
              },
            );
          },
        );
      },
    );
  }
}
