import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/fab_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/selection_cubit.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class GroupFabWidget extends StatelessWidget {
  const GroupFabWidget({super.key, required this.onCreateGroup});

  final VoidCallback onCreateGroup;

  void _vibrate() => unawaited(Haptics.vibrate(HapticsType.selection));

  @override
  Widget build(BuildContext context) {
    final selectionEnabled = context.select<SelectionCubit, bool>(
      (c) => c.state.enabled,
    );

    return ExpandableFab(
      type: ExpandableFabType.up,
      distance: 80,
      onOpen: _vibrate,
      onClose: _vibrate,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        fabSize: ExpandableFabSize.regular,
        heroTag: 'group-fab-open',
        child: const Icon(Icons.menu),
      ),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
        fabSize: ExpandableFabSize.regular,
        heroTag: 'group-fab-close',
        child: const Icon(Icons.close),
      ),
      children: [
        // Toggle Selection Mode
        FabWidget(
          heroTag: 'fab-toggle-selection',
          onPressed: () => context.read<SelectionCubit>().toggleMode(),
          child: Icon(
            selectionEnabled
                ? Icons.library_add_check
                : Icons.library_add_check_outlined,
          ),
        ),

        // Select All
        FabWidget(
          heroTag: 'fab-toggle-select-all',
          onPressed: () {
            final history = context.read<HistoryCubit>();
            final selection = context.read<SelectionCubit>();
            final idsInView = history.groupIdsForCurrentView();

            if (!selectionEnabled) {
              selection.enableWith(idsInView);
            } else {
              selection.toggleAll(idsInView);
            }
          },
          child: Icon(selectionEnabled ? Icons.checklist : Icons.select_all),
        ),

        // Delete Selected
        FabWidget(
          heroTag: 'fab-delete-selected',
          onPressed: () {
            final selection = context.read<SelectionCubit>();
            final selectedIds = selection.state.selected;

            if (selectedIds.isEmpty) return;

            context.read<HistoryCubit>().removeGroupsFromCurrentView(
              selectedIds,
            );

            selection.clear();
          },
          child: const Icon(Icons.delete_outline),
        ),

        // Create Group
        FabWidget(
          heroTag: 'fab-create-group',
          onPressed: onCreateGroup,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
