import 'package:flutter/material.dart';
import 'package:flutter_application/features/history/bloc/selection_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/history_state.dart';
import 'package:flutter_application/features/history/widgets/scan_list_widget.dart';
import 'package:flutter_application/features/history/widgets/scan_fab_widget.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ScanListPage extends StatelessWidget {
  const ScanListPage({super.key, required this.groupId});
  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectionCubit>(
      create: (_) => SelectionCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocSelector<HistoryCubit, HistoryState, String?>(
            selector: (s) => s.groups[groupId]?.title,
            builder: (_, title) => Text(title ?? 'Group'),
          ),
        ),
        body: ScanListWidget(groupId: groupId),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ScanFabWidget(activeGroupId: groupId),
      ),
    );
  }
}
