import 'package:flutter/material.dart';
import 'package:flutter_application/features/history/dialogs/group_dialogs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/selection_cubit.dart';
import 'package:flutter_application/features/history/widgets/group_list_widget.dart';
import 'package:flutter_application/features/history/widgets/view_switcher_widget.dart';
import 'package:flutter_application/features/history/widgets/group_fab_widget.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectionCubit>(
      create: (_) => SelectionCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('History')),
        body: const Column(
          children: [
            SizedBox(height: 8),
            ViewSwitcherWidget(),
            Expanded(child: GroupListWidget()),
          ],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: GroupFabWidget(
          onCreateGroup: () async {
            final history = context.read<HistoryCubit>();

            final res = await showCreateGroupDialog(context);
            if (res == null) return;

            final (title, noDupes, minLen, maxLen, maxItems) = res;
            history.createGroup(
              title,
              noDuplicates: noDupes,
              minContentLength: minLen,
              maxContentLength: maxLen,
              maxItems: maxItems,
            );

            await Haptics.vibrate(HapticsType.success);
          },
        ),
      ),
    );
  }
}
