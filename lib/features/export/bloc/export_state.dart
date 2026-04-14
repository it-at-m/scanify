import 'package:equatable/equatable.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:flutter_application/features/scan/models/scan_model.dart';

enum ExportFormat { csv, txt, json }

class ExportState extends Equatable {
  final Map<String, GroupModel> groups;
  final Map<String, ScanModel> scans;
  final Set<String> selectedGroupIds;

  final bool isExporting;
  final bool removeDuplicates;
  final ExportFormat format;

  const ExportState({
    required this.groups,
    required this.scans,
    required this.selectedGroupIds,
    this.isExporting = false,
    this.removeDuplicates = true,
    this.format = ExportFormat.csv,
  });

  factory ExportState.initial(
    Map<String, GroupModel> groups,
    Map<String, ScanModel> scans,
  ) {
    return ExportState(
      groups: groups,
      scans: scans,
      selectedGroupIds: <String>{},
    );
  }

  ExportState copyWith({
    Map<String, GroupModel>? groups,
    Map<String, ScanModel>? scans,
    Set<String>? selectedGroupIds,
    bool? isExporting,
    bool? removeDuplicates,
    ExportFormat? format,
  }) {
    return ExportState(
      groups: groups ?? this.groups,
      scans: scans ?? this.scans,
      selectedGroupIds: selectedGroupIds ?? this.selectedGroupIds,
      isExporting: isExporting ?? this.isExporting,
      removeDuplicates: removeDuplicates ?? this.removeDuplicates,
      format: format ?? this.format,
    );
  }

  bool get allSelected =>
      groups.isNotEmpty && selectedGroupIds.length == groups.length;

  int get selectedScanCount {
    return selectedGroupIds
        .map((id) => groups[id]?.scanIds.length ?? 0)
        .fold(0, (prev, curr) => prev + curr);
  }

  @override
  List<Object?> get props => [
    groups,
    scans,
    selectedGroupIds,
    isExporting,
    removeDuplicates,
    format,
  ];
}
