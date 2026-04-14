import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/card_widget.dart';
import 'package:flutter_application/features/export/bloc/export_cubit.dart';
import 'package:flutter_application/features/export/bloc/export_state.dart';
import 'package:flutter_application/features/export/sheets/group_selection_sheet_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportPage extends StatelessWidget {
  const ExportPage({super.key});

  Future<void> _handleExport(BuildContext context) async {
    final cubit = context.read<ExportCubit>();
    final messenger = ScaffoldMessenger.of(context);

    await Haptics.vibrate(HapticsType.selection);

    final data = await cubit.generateExportData();

    if (data == null) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Nothing to export')),
      );
      return;
    }

    final (content, mime, ext) = data;

    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/export.$ext');
      await file.writeAsString(content);

      final params = ShareParams(
        subject: 'Export Data',
        files: [XFile(file.path, mimeType: mime, name: 'export.$ext')],
      );

      await SharePlus.instance.share(params);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Export failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export')),
      body: BlocBuilder<ExportCubit, ExportState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 6),
              CardWidget(
                selected: state.selectedGroupIds.isNotEmpty,
                child: ListTile(
                  leading: const Icon(Icons.folder_copy_outlined),
                  title: const Text('Select Groups'),
                  subtitle: Text(
                    state.selectedGroupIds.isEmpty
                        ? 'No groups selected'
                        : '${state.selectedGroupIds.length} groups selected',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await Haptics.vibrate(HapticsType.selection);
                    if (!context.mounted) return;

                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (_) => BlocProvider.value(
                        value: context.read<ExportCubit>(),
                        child: const GroupSelectionSheetExport(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              ListTile(
                leading: const Icon(Icons.filter_alt_outlined),
                title: const Text('Drop Duplicates'),
                subtitle: const Text('Ignore identical scans'),
                trailing: Switch.adaptive(
                  value: state.removeDuplicates,
                  onChanged: (v) =>
                      context.read<ExportCubit>().setRemoveDuplicates(v),
                ),
              ),

              const SizedBox(height: 24),

              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Text(
                  'Export Format',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SegmentedButton<ExportFormat>(
                  showSelectedIcon: false,
                  segments: const [
                    ButtonSegment(
                      value: ExportFormat.csv,
                      label: Text('CSV'),
                      icon: Icon(Icons.table_chart_outlined),
                    ),
                    ButtonSegment(
                      value: ExportFormat.txt,
                      label: Text('Text'),
                      icon: Icon(Icons.description_outlined),
                    ),
                    ButtonSegment(
                      value: ExportFormat.json,
                      label: Text('JSON'),
                      icon: Icon(Icons.code),
                    ),
                  ],
                  selected: {state.format},
                  onSelectionChanged: (Set<ExportFormat> newSelection) {
                    context.read<ExportCubit>().setFormat(newSelection.first);
                  },
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed:
                        state.selectedGroupIds.isEmpty || state.isExporting
                        ? null
                        : () => _handleExport(context),
                    child: state.isExporting
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Share Export'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
