import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/history_state.dart';

class ViewSwitcherWidget extends StatelessWidget {
  const ViewSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocSelector<HistoryCubit, HistoryState, HistoryViewMode>(
        selector: (s) => s.viewMode,
        builder: (context, mode) {
          return SegmentedButton<HistoryViewMode>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(
                value: HistoryViewMode.last,
                label: Text('Last'),
                icon: Icon(Icons.today),
              ),
              ButtonSegment(
                value: HistoryViewMode.custom,
                label: Text('Custom'),
                icon: Icon(Icons.folder),
              ),
            ],
            selected: {mode},
            onSelectionChanged: (Set<HistoryViewMode> newSelection) {
              context.read<HistoryCubit>().setViewMode(newSelection.first);
            },
          );
        },
      ),
    );
  }
}
