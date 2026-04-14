import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/fab_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/selection_cubit.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class ScanFabWidget extends StatefulWidget {
  final String activeGroupId;

  const ScanFabWidget({super.key, required this.activeGroupId});

  @override
  State<ScanFabWidget> createState() => _ScanFabWidgetState();
}

class _ScanFabWidgetState extends State<ScanFabWidget> {
  final _fabKey = GlobalKey<ExpandableFabState>();

  void _vibrate() => unawaited(Haptics.vibrate(HapticsType.selection));

  @override
  Widget build(BuildContext context) {
    final selectionEnabled = context.select<SelectionCubit, bool>(
      (c) => c.state.enabled,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 114),
      child: ExpandableFab(
        key: _fabKey,
        type: ExpandableFabType.up,
        distance: 80,
        onOpen: _vibrate,
        onClose: _vibrate,

        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          heroTag: 'scan-fab-open',
        ),

        closeButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.regular,
          heroTag: 'scan-fab-close',
        ),

        children: [
          // Toggle Selection
          FabWidget(
            heroTag: 'fab-toggle-selection-scan',
            onPressed: () {
              context.read<SelectionCubit>().toggleMode();
            },
            child: Icon(
              selectionEnabled
                  ? Icons.library_add_check
                  : Icons.library_add_check_outlined,
            ),
          ),

          // Select All
          FabWidget(
            heroTag: 'fab-toggle-select-all-scan',
            onPressed: () {
              final history = context.read<HistoryCubit>();
              final selection = context.read<SelectionCubit>();

              final idsInView =
                  history.state.groups[widget.activeGroupId]?.scanIds ?? [];

              if (!selectionEnabled) {
                selection.enableWith(idsInView);
              } else {
                selection.toggleAll(idsInView);
              }
            },
            child: Icon(selectionEnabled ? Icons.checklist : Icons.select_all),
          ),

          // Delete
          FabWidget(
            heroTag: 'fab-delete-selected-scan',
            onPressed: () {
              final history = context.read<HistoryCubit>();
              final selection = context.read<SelectionCubit>();
              final selectedIds = selection.state.selected;

              if (selectedIds.isEmpty) return;
              history.removeScansFromGroup(widget.activeGroupId, selectedIds);

              selection.clear();
            },
            child: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
