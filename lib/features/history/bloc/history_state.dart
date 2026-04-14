import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:flutter_application/features/scan/models/scan_model.dart';

part 'history_state.freezed.dart';
part 'history_state.g.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(<String, ScanModel>{}) Map<String, ScanModel> scans,
    @Default(<String, GroupModel>{}) Map<String, GroupModel> groups,

    @Default(HistoryViewMode.last) HistoryViewMode viewMode,
  }) = _HistoryState;

  factory HistoryState.fromJson(Map<String, dynamic> json) =>
      _$HistoryStateFromJson(json);
}
