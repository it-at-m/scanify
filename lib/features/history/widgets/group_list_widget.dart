import 'package:flutter/material.dart';
import 'package:flutter_application/features/history/bloc/selection_cubit.dart';
import 'package:flutter_application/features/history/bloc/selection_state.dart';
import 'package:flutter_application/features/history/dialogs/group_dialogs.dart';
import 'package:flutter_application/features/history/views/scan_list_page.dart';
import 'package:flutter_application/features/history/widgets/group_element_widget.dart';
import 'package:flutter_application/features/history/widgets/not_found_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/history_state.dart';
import 'package:flutter_application/features/history/models/group_model.dart';

class GroupListWidget extends StatelessWidget {
  const GroupListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HistoryCubit, HistoryState, List<GroupModel>>(
      selector: (state) {
        final all = state.groups.values.toList();

        all.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return switch (state.viewMode) {
          HistoryViewMode.last => all.where((g) => g.isSystem).toList(),
          HistoryViewMode.custom => all.where((g) => !g.isSystem).toList(),
        };
      },
      builder: (context, groups) {
        if (groups.isEmpty) {
          return const NotFoundWidget(
            icon: Icons.history,
            title: 'No entries yet',
            subtitle: 'Add a scan or create a custom group to start.',
          );
        }

        return BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, selection) {
            final enabled = selection.enabled;
            final selected = selection.selected;
            final history = context.read<HistoryCubit>();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final g = groups[index];
                return GroupElementWidget(
                  group: g,
                  selectionEnabled: enabled,
                  selected: selected.contains(g.id),
                  onSelectToggle: () {
                    final cubit = context.read<SelectionCubit>();
                    if (!cubit.state.enabled) cubit.toggleMode();
                    cubit.toggle(g.id);
                  },
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ScanListPage(groupId: g.id),
                      ),
                    );
                  },
                  onDelete: () => history.removeGroup(g.id),
                  onEdit: () async {
                    final res = await showEditGroupDialog(context, g);

                    if (res == null) return;

                    final (title, noDupes, minLen, maxLen, maxItems) = res;

                    history.updateGroup(
                      id: g.id,
                      title: title,
                      noDuplicates: noDupes,
                      minContentLength: minLen,
                      maxContentLength: maxLen,
                      maxItems: maxItems,
                    );
                  },
                  dismissibleKey: ValueKey(g.id),
                );
              },
            );
          },
        );
      },
    );
  }
}
