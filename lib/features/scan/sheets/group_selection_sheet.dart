import 'package:flutter/material.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/core/widgets/sheet_widget.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/scan/bloc/scan_cubit.dart';

class GroupSelectionSheet extends StatefulWidget {
  final Set<String> initialSelection;
  final List<GroupModel> availableGroups;

  const GroupSelectionSheet({
    super.key,
    required this.initialSelection,
    required this.availableGroups,
  });

  static Future<Set<String>?> show(BuildContext context) async {
    final history = context.read<HistoryCubit>();
    final scanCubit = context.read<ScanCubit>();

    final groups =
        history.state.groups.values
            .where((g) => g.id.startsWith('group-'))
            .toList()
          ..sort((a, b) => a.title.compareTo(b.title));

    return showModalBottomSheet<Set<String>>(
      context: context,
      showDragHandle: true,
      builder: (_) => GroupSelectionSheet(
        initialSelection: scanCubit.state.selectedGroupIds,
        availableGroups: groups,
      ),
    );
  }

  @override
  State<GroupSelectionSheet> createState() => _GroupSelectionSheetState();
}

class _GroupSelectionSheetState extends State<GroupSelectionSheet> {
  late Set<String> _currentSelection;

  @override
  void initState() {
    super.initState();
    _currentSelection = Set.from(widget.initialSelection);
  }

  @override
  Widget build(BuildContext context) {
    final hasGroups = widget.availableGroups.isNotEmpty;

    return SheetWidget(
      title: 'Select groups',
      subtitle: 'Scans will be added automatically to the selected groups.',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () => Navigator.of(context).pop(_currentSelection),
      body: hasGroups
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: widget.availableGroups.length,
              itemBuilder: (context, index) {
                final group = widget.availableGroups[index];
                final isSelected = _currentSelection.contains(group.id);

                return CheckboxListTile(
                  value: isSelected,
                  title: Text(group.title),
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true) {
                        _currentSelection.add(group.id);
                      } else {
                        _currentSelection.remove(group.id);
                      }
                    });
                  },
                );
              },
            )
          : const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Center(
                child: Text(
                  'No groups available. Create a custom group in the History > Custom tab.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
    );
  }
}
