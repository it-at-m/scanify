import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/features/export/bloc/export_state.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/history/bloc/history_state.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:flutter_application/features/scan/models/scan_model.dart';

class ExportCubit extends Cubit<ExportState> {
  final HistoryCubit _historyCubit;
  late final StreamSubscription<HistoryState> _historySubscription;

  ExportCubit(this._historyCubit)
    : super(
        ExportState.initial(
          _historyCubit.state.groups,
          _historyCubit.state.scans,
        ),
      ) {
    _historySubscription = _historyCubit.stream.listen(_onHistoryChanged);
  }

  @override
  Future<void> close() async {
    await _historySubscription.cancel();
    await super.close();
  }

  void _onHistoryChanged(HistoryState historyState) {
    final validGroupIds = historyState.groups.keys.toSet();
    final nextSelection = state.selectedGroupIds
        .where((id) => validGroupIds.contains(id))
        .toSet();

    emit(
      state.copyWith(
        groups: historyState.groups,
        scans: historyState.scans,
        selectedGroupIds: nextSelection,
      ),
    );
  }

  void toggleGroup(String groupId) {
    final next = Set<String>.from(state.selectedGroupIds);
    if (next.contains(groupId)) {
      next.remove(groupId);
    } else {
      next.add(groupId);
    }
    emit(state.copyWith(selectedGroupIds: next));
  }

  void toggleAll() {
    if (state.allSelected) {
      emit(state.copyWith(selectedGroupIds: <String>{}));
    } else {
      emit(state.copyWith(selectedGroupIds: state.groups.keys.toSet()));
    }
  }

  void setRemoveDuplicates(bool value) =>
      emit(state.copyWith(removeDuplicates: value));
  void setFormat(ExportFormat format) => emit(state.copyWith(format: format));

  Future<(String, String, String)?> generateExportData() async {
    if (state.selectedGroupIds.isEmpty) return null;

    emit(state.copyWith(isExporting: true));

    try {
      final selectedGroups =
          state.selectedGroupIds
              .map((id) => state.groups[id])
              .whereType<GroupModel>()
              .toList()
            ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

      if (selectedGroups.isEmpty) return null;

      final buffer = StringBuffer();
      final writtenContent = <String>{};

      for (final group in selectedGroups) {
        final scansInGroup =
            group.scanIds
                .map((id) => state.scans[id])
                .whereType<ScanModel>()
                .toList()
              ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

        for (final scan in scansInGroup) {
          if (state.removeDuplicates && writtenContent.contains(scan.content)) {
            continue;
          }

          if (writtenContent.isNotEmpty) buffer.writeln();

          String line = scan.content;

          if (state.format == ExportFormat.csv) {
            line = _escapeCsv(line);
          } else if (state.format == ExportFormat.json) {
            line = '{"content": "$line", "date": "${scan.createdAt}"}';
          }

          buffer.write(line);
          writtenContent.add(scan.content);
        }
      }

      if (writtenContent.isEmpty) return null;

      String mime = 'text/plain';
      String ext = 'txt';

      switch (state.format) {
        case ExportFormat.csv:
          mime = 'text/csv';
          ext = 'csv';
          break;
        case ExportFormat.json:
          mime = 'application/json';
          ext = 'json';
          break;
        case ExportFormat.txt:
          mime = 'text/plain';
          ext = 'txt';
          break;
      }

      return (buffer.toString(), mime, ext);
    } finally {
      emit(state.copyWith(isExporting: false));
    }
  }

  String _escapeCsv(String value) {
    final needsQuotes =
        value.contains(',') || value.contains('"') || value.contains('\n');
    var out = value.replaceAll('"', '""');
    if (needsQuotes) {
      out = '"$out"';
    }
    return out;
  }
}
