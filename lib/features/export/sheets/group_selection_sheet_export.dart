import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/sheet_widget.dart';
import 'package:flutter_application/features/export/bloc/export_cubit.dart';
import 'package:flutter_application/features/export/bloc/export_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupSelectionSheetExport extends StatelessWidget {
  const GroupSelectionSheetExport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportCubit, ExportState>(
      builder: (context, state) {
        final groups = state.groups.values.toList()
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

        return SheetWidget(
          title: 'Select Groups',
          confirmText: 'Done',
          onConfirm: () => Navigator.pop(context),
          body: groups.isEmpty
              ? const Center(child: Text("No groups found"))
              : ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    final isSelected = state.selectedGroupIds.contains(
                      group.id,
                    );

                    return CheckboxListTile(
                      title: Text(group.title),
                      subtitle: Text('${group.scanIds.length} scans'),
                      value: isSelected,
                      onChanged: (_) =>
                          context.read<ExportCubit>().toggleGroup(group.id),
                    );
                  },
                ),
        );
      },
    );
  }
}
